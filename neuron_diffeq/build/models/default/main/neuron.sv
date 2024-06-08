// Model generated on 2024-06-06 15:58:53.469967

`timescale 1ns/1ps

`include "svreal.sv"
`include "msdsl.sv"

`default_nettype none

module neuron #(
    `DECL_REAL(I_in),
    `DECL_REAL(V_out),
    `DECL_REAL(V_out_exp),
    `DECL_REAL(V_out_lin),
    `DECL_REAL(V_out_I),
    `DECL_REAL(V_out_I_mult),
    `DECL_REAL(dv_out)
) (
    `INPUT_REAL(I_in),
    `OUTPUT_REAL(V_out),
    output wire logic digital_sel_out,
    `OUTPUT_REAL(V_out_exp),
    `OUTPUT_REAL(V_out_lin),
    `OUTPUT_REAL(V_out_I),
    `OUTPUT_REAL(V_out_I_mult),
    `OUTPUT_REAL(dv_out)
);
    // Declaring internal variables.
    `MAKE_REAL(V_out_st, 100);
    `MAKE_FORMAT_REAL(real_func_0_coeff_0_0, 1.01, 18, -16);
    logic digital_sel;
    // Assign signal: V_out
    `ASSIGN_REAL(V_out_st, V_out);
    // Assign signal: real_func_0_addr_real_0
    `MAKE_CONST_REAL(100.0, tmp0);
    `ADD_REAL(V_out_st, tmp0, tmp1);
    `MUL_CONST_REAL(99.99, tmp1, tmp2);
    `MAKE_CONST_REAL(0.0, tmp3);
    `MAX_REAL(tmp2, tmp3, tmp4);
    `MAKE_CONST_REAL(9999.0, tmp5);
    `MIN_REAL(tmp4, tmp5, tmp6);
    `MAKE_REAL(real_func_0_addr_real_0, 9999.0);
    `ASSIGN_REAL(tmp6, real_func_0_addr_real_0);
    // Assign signal: real_func_0_addr_sint_0
    `REAL_TO_INT(real_func_0_addr_real_0, 15, tmp7);
    logic signed tmp8;
    assign tmp8 = 0;
    logic signed [14:0] tmp9;
    assign tmp9 = ((tmp7 > tmp8) ? tmp7 : tmp8);
    logic signed [14:0] tmp10;
    assign tmp10 = 9999;
    logic signed [14:0] tmp11;
    assign tmp11 = ((tmp9 < tmp10) ? tmp9 : tmp10);
    logic signed [14:0] real_func_0_addr_sint_0;
    assign real_func_0_addr_sint_0 = tmp11;
    // Assign signal: real_func_0_addr_uint_0
    logic [13:0] tmp12;
    assign tmp12 = real_func_0_addr_sint_0[13:0]; // SInt -> UInt
    logic [13:0] real_func_0_addr_uint_0;
    assign real_func_0_addr_uint_0 = tmp12;
    // Assign signal: real_func_0_addr_frac_0
    logic signed tmp14;
    assign tmp14 = -1;
    logic signed [14:0] tmp15;
    assign tmp15 = (real_func_0_addr_sint_0*tmp14);
    `INT_TO_REAL(tmp15, 15, tmp13);
    `ADD_REAL(real_func_0_addr_real_0, tmp13, tmp16);
    `MAKE_REAL(real_func_0_addr_frac_0, 1.01);
    `ASSIGN_REAL(tmp16, real_func_0_addr_frac_0);
    // Assign signal: real_func_0_coeff_0_0
    `SYNC_ROM_INTO_REAL(real_func_0_addr_uint_0, real_func_0_coeff_0_0, `CLK_MSDSL, 1'b1, 14, 18, "/home/will/Desktop/SP2024/EE207/NEEMS/neuron_mv/build/models/default/main/real_func_0_lut_0_exp_-16.mem", -16);
    // Assign signal: exp
    `MAKE_FORMAT_REAL(exp, 1.01, 18, -16);
    `ASSIGN_REAL(real_func_0_coeff_0_0, exp);
    // Assign signal: digital_sel
    `MAKE_CONST_REAL(-50.4, tmp18);
    `LE_REAL(V_out_st, tmp18, tmp17);
    assign digital_sel = tmp17;
    // Assign signal: digital_sel_out
    assign digital_sel_out = digital_sel;
    // Assign signal: V_out_st
    `MAKE_REAL(tmp19, (`MAX_MATH(((((`RANGE_PARAM_REAL(I_in)*1000)+0.03246085795159375)*1.7683882565766151)+100), 70.6)*1.01));
    `MAKE_CONST_REAL(-70.6, tmp20);
    `NEGATE_REAL(V_out_st, tmp21);
    `MAKE_CONST_REAL(-70.6, tmp22);
    `ADD_REAL(tmp21, tmp22, tmp23);
    `MUL_CONST_REAL(2.827433388230814e-06, tmp23, tmp24);
    `MAKE_CONST_REAL(50.4, tmp25);
    `ADD_REAL(V_out_st, tmp25, tmp26);
    `MAKE_CONST_REAL(50.4, tmp27);
    `ADD_REAL(V_out_st, tmp27, tmp28);
    `MAKE_CONST_REAL(1.413716694115407e-06, tmp29);
    `MUL_REAL(tmp28, tmp29, tmp30);
    `MUL_REAL(tmp26, tmp30, tmp31);
    `MUL_CONST_REAL(1000.0, I_in, tmp32);
    `ADD_REAL(tmp31, tmp32, tmp33);
    `ADD_REAL(tmp24, tmp33, tmp34);
    `MUL_CONST_REAL(1.7683882565766151, tmp34, tmp35);
    `ADD_REAL(V_out_st, tmp35, tmp36);
    `MAKE_REAL(tmp37, (`MAX_MATH(((((`RANGE_PARAM_REAL(I_in)*1000)+0.03246085795159375)*1.7683882565766151)+100), 70.6)*1.01));
    `ASSIGN_REAL(tmp20, tmp37);
    `MAKE_REAL(tmp38, (`MAX_MATH(((((`RANGE_PARAM_REAL(I_in)*1000)+0.03246085795159375)*1.7683882565766151)+100), 70.6)*1.01));
    `ASSIGN_REAL(tmp36, tmp38);
    always @(*) begin
        case (digital_sel)
            0: tmp19 = tmp37;
            1: tmp19 = tmp38;
            default: tmp19 = 0;
        endcase
    end
    `DFF_INTO_REAL(tmp19, V_out_st, `RST_MSDSL, `CLK_MSDSL, 1'b1, -70.6);
    // Assign signal: V_out_exp
    `ASSIGN_REAL(exp, V_out_exp);
    // Assign signal: V_out_lin
    `ASSIGN_REAL(V_out_st, V_out_lin);
    // Assign signal: V_out_I
    `ASSIGN_REAL(I_in, V_out_I);
    // Assign signal: V_out_I_mult
    `MAKE_REAL(tmp39, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)*1000)+0.03246085795159375)*1.7683882565766151), 70.6)*1.01));
    `MAKE_CONST_REAL(-70.6, tmp40);
    `NEGATE_REAL(V_out_st, tmp41);
    `MAKE_CONST_REAL(-70.6, tmp42);
    `ADD_REAL(tmp41, tmp42, tmp43);
    `MUL_CONST_REAL(2.827433388230814e-06, tmp43, tmp44);
    `MAKE_CONST_REAL(50.4, tmp45);
    `ADD_REAL(V_out_st, tmp45, tmp46);
    `MAKE_CONST_REAL(50.4, tmp47);
    `ADD_REAL(V_out_st, tmp47, tmp48);
    `MAKE_CONST_REAL(1.413716694115407e-06, tmp49);
    `MUL_REAL(tmp48, tmp49, tmp50);
    `MUL_REAL(tmp46, tmp50, tmp51);
    `MUL_CONST_REAL(1000.0, I_in, tmp52);
    `ADD_REAL(tmp51, tmp52, tmp53);
    `ADD_REAL(tmp44, tmp53, tmp54);
    `MUL_CONST_REAL(1.7683882565766151, tmp54, tmp55);
    `MAKE_REAL(tmp56, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)*1000)+0.03246085795159375)*1.7683882565766151), 70.6)*1.01));
    `ASSIGN_REAL(tmp40, tmp56);
    `MAKE_REAL(tmp57, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)*1000)+0.03246085795159375)*1.7683882565766151), 70.6)*1.01));
    `ASSIGN_REAL(tmp55, tmp57);
    always @(*) begin
        case (digital_sel)
            0: tmp39 = tmp56;
            1: tmp39 = tmp57;
            default: tmp39 = 0;
        endcase
    end
    `ASSIGN_REAL(tmp39, V_out_I_mult);
    // Assign signal: dv_out
    `ASSIGN_REAL(exp, dv_out);
endmodule

`default_nettype wire
