module SP(
  clk,
  rst,
  in_valid,
  instruction,
  busy,
  out_valid,
  out
);
input clk;
input rst;
input in_valid;
input [13:0] instruction;
output reg busy;
output reg out_valid;
output reg [7:0] out;
reg  s1_valid, s2_valid;
reg  [1:0]  s1_opcode, s2_opcode;
reg  [7:0]  s1_rs, s1_rt, s1_rd, s1_writedata;
reg  [3:0]  s1_target, s2_target, s1_rsaddr, s1_rtaddr;
reg  [15:0] s2_result;
reg  [7:0]  r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;

// your design 
always@(posedge clk)
begin
  if (rst) begin
    busy <= 0;
    out_valid <= 0;
    s1_valid <= 0;
    s2_valid <= 0;
    out <= 0;
    r0 <= 0;
    r1 <= 0;
    r2 <= 0;
    r3 <= 0;
    r4 <= 0;
    r5 <= 0;
    r6 <= 0;
    r7 <= 0;
    r8 <= 0;
    r9 <= 0;
    r10 <= 0;
    r11 <= 0;
    r12 <= 0;
    r13 <= 0;
    r14 <= 0;
    r15 <= 0;
  end
  else begin
    s1_valid <= in_valid;
    s2_valid <= s1_valid;
    out_valid <= s2_valid;
    s1_opcode <= instruction[13:12];
    s2_opcode <= s1_opcode;
    out <= s2_result[7:0];
    s1_rsaddr <= instruction[11:8];
    s1_rtaddr <= instruction[7:4];
    if(s2_opcode != 2'b11 && instruction[13:12] != 2'b10)begin
      if(instruction[11:8] == s2_target)begin
        case(instruction[11:8])
          4'd0: r0 = s2_result;
          4'd1: r1 = s2_result;
          4'd2: r2 = s2_result;
          4'd3: r3 = s2_result;
          4'd4: r4 = s2_result;
          4'd5: r5 = s2_result;
          4'd6: r6 = s2_result;
          4'd7: r7 = s2_result;
          4'd8: r8 = s2_result;
          4'd9: r9 = s2_result;
          4'd10: r10 = s2_result;
          4'd11: r11 = s2_result;
          4'd12: r12 = s2_result;
          4'd13: r13 = s2_result;
          4'd14: r14 = s2_result;
          4'd15: r15 = s2_result;
        endcase
      end
      else if(instruction[7:4] == s2_target)begin
        case(instruction[7:4])
          4'd0: r0 = s2_result;
          4'd1: r1 = s2_result;
          4'd2: r2 = s2_result;
          4'd3: r3 = s2_result;
          4'd4: r4 = s2_result;
          4'd5: r5 = s2_result;
          4'd6: r6 = s2_result;
          4'd7: r7 = s2_result;
          4'd8: r8 = s2_result;
          4'd9: r9 = s2_result;
          4'd10: r10 = s2_result;
          4'd11: r11 = s2_result;
          4'd12: r12 = s2_result;
          4'd13: r13 = s2_result;
          4'd14: r14 = s2_result;
          4'd15: r15 = s2_result;
        endcase
      end
    end
    case (instruction[11:8])
      4'd0: s1_rs <= r0;
      4'd1: s1_rs <= r1;
      4'd2: s1_rs <= r2;
      4'd3: s1_rs <= r3;
      4'd4: s1_rs <= r4;
      4'd5: s1_rs <= r5;
      4'd6: s1_rs <= r6;
      4'd7: s1_rs <= r7;
      4'd8: s1_rs <= r8;
      4'd9: s1_rs <= r9;
      4'd10: s1_rs <= r10;
      4'd11: s1_rs <= r11;
      4'd12: s1_rs <= r12;
      4'd13: s1_rs <= r13;
      4'd14: s1_rs <= r14;
      4'd15: s1_rs <= r15;
    endcase
    case (instruction[7:4])
      4'd0: s1_rt <= r0;
      4'd1: s1_rt <= r1;
      4'd2: s1_rt <= r2;
      4'd3: s1_rt <= r3;
      4'd4: s1_rt <= r4;
      4'd5: s1_rt <= r5;
      4'd6: s1_rt <= r6;
      4'd7: s1_rt <= r7;
      4'd8: s1_rt <= r8;
      4'd9: s1_rt <= r9;
      4'd10: s1_rt <= r10;
      4'd11: s1_rt <= r11;
      4'd12: s1_rt <= r12;
      4'd13: s1_rt <= r13;
      4'd14: s1_rt <= r14;
      4'd15: s1_rt <= r15;
    endcase
    if(instruction[13:12] == 2'b10) s1_target <= instruction[11:8];
    else s1_target <= instruction[3:0];
    s1_writedata <= instruction[7:0];
    s2_target <= s1_target;
    /*case (instruction[13:12])
      2'b00 : begin
        case (instruction[11:8])
          4'd0: s1_rs <= r0;
          4'd1: s1_rs <= r1;
          4'd2: s1_rs <= r2;
          4'd3: s1_rs <= r3;
          4'd4: s1_rs <= r4;
          4'd5: s1_rs <= r5;
          4'd6: s1_rs <= r6;
          4'd7: s1_rs <= r7;
          4'd8: s1_rs <= r8;
          4'd9: s1_rs <= r9;
          4'd10: s1_rs <= r10;
          4'd11: s1_rs <= r11;
          4'd12: s1_rs <= r12;
          4'd13: s1_rs <= r13;
          4'd14: s1_rs <= r14;
          4'd15: s1_rs <= r15;
          default: s1_rs <= r0;
        endcase
        case (instruction[7:4])
          4'd0: s1_rt <= r0;
          4'd1: s1_rt <= r1;
          4'd2: s1_rt <= r2;
          4'd3: s1_rt <= r3;
          4'd4: s1_rt <= r4;
          4'd5: s1_rt <= r5;
          4'd6: s1_rt <= r6;
          4'd7: s1_rt <= r7;
          4'd8: s1_rt <= r8;
          4'd9: s1_rt <= r9;
          4'd10: s1_rt <= r10;
          4'd11: s1_rt <= r11;
          4'd12: s1_rt <= r12;
          4'd13: s1_rt <= r13;
          4'd14: s1_rt <= r14;
          4'd15: s1_rt <= r15;
          default: s1_rt <= r0;
        endcase
        s1_target <= instruction[3:0];
      end
      2'b01 : begin
        case (instruction[11:8])
          4'd0: s1_rs <= r0;
          4'd1: s1_rs <= r1;
          4'd2: s1_rs <= r2;
          4'd3: s1_rs <= r3;
          4'd4: s1_rs <= r4;
          4'd5: s1_rs <= r5;
          4'd6: s1_rs <= r6;
          4'd7: s1_rs <= r7;
          4'd8: s1_rs <= r8;
          4'd9: s1_rs <= r9;
          4'd10: s1_rs <= r10;
          4'd11: s1_rs <= r11;
          4'd12: s1_rs <= r12;
          4'd13: s1_rs <= r13;
          4'd14: s1_rs <= r14;
          4'd15: s1_rs <= r15;
          default: s1_rs <= r0;
        endcase
        case (instruction[7:4])
          4'd0: s1_rt <= r0;
          4'd1: s1_rt <= r1;
          4'd2: s1_rt <= r2;
          4'd3: s1_rt <= r3;
          4'd4: s1_rt <= r4;
          4'd5: s1_rt <= r5;
          4'd6: s1_rt <= r6;
          4'd7: s1_rt <= r7;
          4'd8: s1_rt <= r8;
          4'd9: s1_rt <= r9;
          4'd10: s1_rt <= r10;
          4'd11: s1_rt <= r11;
          4'd12: s1_rt <= r12;
          4'd13: s1_rt <= r13;
          4'd14: s1_rt <= r14;
          4'd15: s1_rt <= r15;
          default: s1_rt <= r0;
        endcase
        s1_target <= instruction[3:0];
      end
      2'b10 : begin
        s1_target <= instruction[11:8];
        s1_rs <= instruction[7:0];
      end
      2'b11 : begin
        case (instruction[11:8])
          4'd0: s1_rs <= r0;
          4'd1: s1_rs <= r1;
          4'd2: s1_rs <= r2;
          4'd3: s1_rs <= r3;
          4'd4: s1_rs <= r4;
          4'd5: s1_rs <= r5;
          4'd6: s1_rs <= r6;
          4'd7: s1_rs <= r7;
          4'd8: s1_rs <= r8;
          4'd9: s1_rs <= r9;
          4'd10: s1_rs <= r10;
          4'd11: s1_rs <= r11;
          4'd12: s1_rs <= r12;
          4'd13: s1_rs <= r13;
          4'd14: s1_rs <= r14;
          4'd15: s1_rs <= r15;
          default: s1_rs <= r0;
        endcase
      end
      default: 
    endcase*/
    if(s2_opcode != 2'b11 && s1_opcode != 2'b10)begin
      if(s1_rsaddr == s2_target) s1_rs = s2_result;
      else if(s1_rtaddr == s2_target) s1_rt = s2_result;
    end
    case (s1_opcode)
      2'b00: s2_result <= s1_rs + s1_rt;
      2'b01: s2_result <= s1_rs * s1_rt;
      2'b10: s2_result <= s1_writedata;
      2'b11: s2_result <= s1_rs;
    endcase
    if(s2_opcode == 2'b00 || s2_opcode == 2'b01 || s2_opcode == 2'b10)begin
      case (s2_target)
        4'd0: r0 <= s2_result;
        4'd1: r1 <= s2_result;
        4'd2: r2 <= s2_result;
        4'd3: r3 <= s2_result;
        4'd4: r4 <= s2_result;
        4'd5: r5 <= s2_result;
        4'd6: r6 <= s2_result;
        4'd7: r7 <= s2_result;
        4'd8: r8 <= s2_result;
        4'd9: r9 <= s2_result;
        4'd10: r10 <= s2_result;
        4'd11: r11 <= s2_result;
        4'd12: r12 <= s2_result;
        4'd13: r13 <= s2_result;
        4'd14: r14 <= s2_result;
        4'd15: r15 <= s2_result;
      endcase
    end
    /*case (s2_opcode)
      2'b00: begin
        case (s2_target)
          4'd0: r0 <= s2_result;
          4'd1: r1 <= s2_result;
          4'd2: r2 <= s2_result;
          4'd3: r3 <= s2_result;
          4'd4: r4 <= s2_result;
          4'd5: r5 <= s2_result;
          4'd6: r6 <= s2_result;
          4'd7: r7 <= s2_result;
          4'd8: r8 <= s2_result;
          4'd9: r9 <= s2_result;
          4'd10: r10 <= s2_result;
          4'd11: r11 <= s2_result;
          4'd12: r12 <= s2_result;
          4'd13: r13 <= s2_result;
          4'd14: r14 <= s2_result;
          4'd15: r15 <= s2_result;
        endcase
      end 
      2'b01: begin
        case (s2_target)
          4'd0: r0 <= s2_result;
          4'd1: r1 <= s2_result;
          4'd2: r2 <= s2_result;
          4'd3: r3 <= s2_result;
          4'd4: r4 <= s2_result;
          4'd5: r5 <= s2_result;
          4'd6: r6 <= s2_result;
          4'd7: r7 <= s2_result;
          4'd8: r8 <= s2_result;
          4'd9: r9 <= s2_result;
          4'd10: r10 <= s2_result;
          4'd11: r11 <= s2_result;
          4'd12: r12 <= s2_result;
          4'd13: r13 <= s2_result;
          4'd14: r14 <= s2_result;
          4'd15: r15 <= s2_result;
        endcase
      end
      2'b10: begin
        case (s2_target)
          4'd0: r0 <= s2_result;
          4'd1: r1 <= s2_result;
          4'd2: r2 <= s2_result;
          4'd3: r3 <= s2_result;
          4'd4: r4 <= s2_result;
          4'd5: r5 <= s2_result;
          4'd6: r6 <= s2_result;
          4'd7: r7 <= s2_result;
          4'd8: r8 <= s2_result;
          4'd9: r9 <= s2_result;
          4'd10: r10 <= s2_result;
          4'd11: r11 <= s2_result;
          4'd12: r12 <= s2_result;
          4'd13: r13 <= s2_result;
          4'd14: r14 <= s2_result;
          4'd15: r15 <= s2_result;
        endcase
      end
      default: 
    endcase*/
  end
end






endmodule


