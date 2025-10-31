`timescale 1ns / 1ps

module tb_kogge_stone_adder_32;

    // ----------------------------------------------------
    // Parameters
    // ----------------------------------------------------
    localparam PRECISION = 32;
    localparam SIM_DELAY = 10;

    // ----------------------------------------------------
    // Testbench signals
    // ----------------------------------------------------
    reg  [PRECISION-1:0] tb_operand_a;
    reg  [PRECISION-1:0] tb_operand_b;
    wire [PRECISION-1:0] tb_result;
    wire                 tb_overflow;

    // Expected results for self-checking
    wire [PRECISION:0] expected_sum;
    wire               expected_overflow;

    assign expected_sum      = tb_operand_a + tb_operand_b;
    assign expected_overflow = expected_sum[PRECISION];

    // ----------------------------------------------------
    // Instantiate the DUT (Device Under Test)
    // ----------------------------------------------------
    kogge_stone_adder_32 #(
        .PRECISION(PRECISION)
    ) dut_inst (
        .operand_a_i(tb_operand_a),
        .operand_b_i(tb_operand_b),
        .result_o(tb_result),
        .overflow_o(tb_overflow)
    );

    // ----------------------------------------------------
    // Test stimulus
    // ----------------------------------------------------
    initial begin
        $display("--------------------------------------------------");
        $display("       Starting 32-bit Kogge-Stone Adder Testbench");
        $display("--------------------------------------------------");
        $display(" PRECISION = %0d bits", PRECISION);
        $display("--------------------------------------------------");
        $display("Time\t\tA\t\t+\tB\t\t|\tDUT Result\tOvflw\t|\tExpected\tExp Ovflw\tStatus");
        $display("--------------------------------------------------");

        tb_operand_a = 0;
        tb_operand_b = 0;
        #SIM_DELAY;
        check_result(32'd0, 32'd0);

        // Deterministic test cases
        check_result(32'd10,  32'd25);
        check_result(32'd88,  32'd42);
        check_result({PRECISION{1'b1}}, 32'd0);  // Max + 0
        check_result({PRECISION{1'b1}}, 32'd1);  // Overflow test
        check_result(32'd150, 32'd150);          // Overflow test

        // Randomized test cases
        $display("\n--- Running 10 Random Test Cases ---");
        for (integer i = 0; i < 10; i = i + 1) begin
            check_result($random, $random);
        end
        $display("--- End of Random Test Cases ---\n");

        $display("--------------------------------------------------");
        $display("       Testbench simulation finished successfully!");
        $display("--------------------------------------------------");
        $finish;
    end

    // ----------------------------------------------------
    // Self-checking task
    // ----------------------------------------------------
    task check_result;
        input [PRECISION-1:0] a;
        input [PRECISION-1:0] b;
        begin
            tb_operand_a = a;
            tb_operand_b = b;
            #SIM_DELAY;

            if ((tb_result === expected_sum[PRECISION-1:0]) &&
                (tb_overflow === expected_overflow)) begin
                $display("%0t\t%d + %d\t|\t%d\t%b\t|\t%d\t%b\tPASS",
                         $time, tb_operand_a, tb_operand_b,
                         tb_result, tb_overflow,
                         expected_sum[PRECISION-1:0], expected_overflow);
            end
            else begin
                $error("MISMATCH DETECTED!");
                $display("%0t\t%d + %d\t|\t%d\t%b\t|\t%d\t%b\tFAIL",
                         $time, tb_operand_a, tb_operand_b,
                         tb_result, tb_overflow,
                         expected_sum[PRECISION-1:0], expected_overflow);
            end
        end
    endtask

endmodule
