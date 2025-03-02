module instruction_fsm (
    input wire clk,
    input wire rst_n,
    input wire [8:0] addr_in,   // 9-bit IRAM address (starting address)
    input wire [31:0] inst_in,  // 32-bit instruction input
    output reg [31:0] inst_out, // 32-bit instruction output to IRAM
    output reg [8:0] addr_out,  // Address output to IRAM
    output reg write_enable,    // Write enable signal for IRAM
    output reg [31:0] flag_reg  // 32-bit flag register (only LSB is used)
);

    // 定义状态
    typedef enum logic [2:0] {
        IDLE  = 3'b000, // 等待新指令
        FETCH = 3'b001, // 读取指令
        SEND  = 3'b010, // 发送指令到 IRAM
        INC   = 3'b011, // 地址递增
        DONE  = 3'b100  // 传输完成，回到 IDLE
    } state_t;

    state_t state, next_state;

    // 状态机跳转逻辑
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // 状态转换逻辑
    always @(*) begin
        case (state)
            IDLE: 
                if (addr_in != 9'b0) // 地址有效，进入 FETCH
                    next_state = FETCH;
                else
                    next_state = IDLE;
            
            FETCH: 
                next_state = SEND; // 读取指令后，进入 SEND 以写入 IRAM

            SEND: 
                next_state = INC; // 发送后递增地址

            INC:
                next_state = DONE; // 进入 DONE，表示一次完整的传输完成

            DONE: 
                next_state = IDLE; // 传输完成后回到 IDLE，等待下一条指令

            default: 
                next_state = IDLE;
        endcase
    end

    // 数据传输逻辑
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            inst_out <= 32'b0;
            addr_out <= 9'b0;
            write_enable <= 1'b0;
            flag_reg <= 32'b0;
        end else begin
            case (state)
                IDLE: begin
                    inst_out <= 32'b0;
                    addr_out <= addr_in; // 初始化地址
                    write_enable <= 1'b0;
                    flag_reg[0] <= 1'b1; // 开始传输
                end
                FETCH: begin
                    inst_out <= inst_in; // 读取指令
                    write_enable <= 1'b1; // 触发写入 IRAM
                end
                SEND: begin
                    write_enable <= 1'b0; // 关闭写使能
                end
                INC: begin
                    addr_out <= addr_out + 4; // **地址递增 4，下一条指令地址**
                end
                DONE: begin
                    flag_reg[0] <= 1'b0; // **传输成功，设置 LSB**
                end
            endcase
        end
    end

endmodule
