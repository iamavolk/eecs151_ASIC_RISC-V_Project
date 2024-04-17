// define 6-bit codes for each instruction in the set
`ifndef INSTR
`define INSTR

// R-type
`define ADD	6'd0
`define SUB	6'd1
`define SLL	6'd2
`define SLT	6'd3
`define SLTU	6'd4
`define XOR	6'd5
`define SRL	6'd6
`define SRA	6'd7
`define OR	6'd8
`define AND	6'd9

// I-load-type
`define LB	6'd10
`define LH	6'd11
`define LW	6'd12
`define LBU	6'd13
`define LHU	6'd14

// I-ALU-type
`define ADDI	6'd15
`define SLLI	6'd16
`define SLTI	6'd17
`define SLTIU	6'd18
`define XORI	6'd19
`define SRLI	6'd20
`define SRAI	6'd21
`define ORI	6'd22
`define ANDI	6'd23

// S-type
`define SB	6'd24
`define SH	6'd25
`define SW	6'd26

// B-type
`define BEQ	6'd27
`define BNE	6'd28
`define BLT	6'd29
`define BGE	6'd30
`define BLTU	6'd31
`define BGEU	6'd32

// U-type
`define AUIPC	6'd33
`define LUI	6'd34

// J-type
`define JAL	6'd35

// I-jump-type
`define JALR	6'd36

// Nope
`define NOPE 6'd37

`endif
