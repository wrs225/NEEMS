// Model generated on 2024-06-08 15:58:06.569680

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
    `OUTPUT_REAL(V_out_exp),
    `OUTPUT_REAL(V_out_lin),
    `OUTPUT_REAL(V_out_I),
    `OUTPUT_REAL(V_out_I_mult),
    `OUTPUT_REAL(dv_out),
    output wire logic digital_sel_out
);
    // Declaring internal variables.
    `MAKE_REAL(V_out_st, 1000);
    logic digital_sel;
    // Assign signal: digital_sel
    `MAKE_CONST_REAL(-38.4, tmp1);
    `LE_REAL(V_out_st, tmp1, tmp0);
    assign digital_sel = tmp0;
    // Assign signal: V_out
    `ASSIGN_REAL(V_out_st, V_out);
    // Assign signal: V_out_exp
    `MAKE_CONST_REAL(50.4, tmp2);
    `ADD_REAL(V_out_st, tmp2, tmp3);
    `MUL_CONST_REAL(0.5, tmp3, tmp4);
    `MAKE_CONST_REAL(50.4, tmp5);
    `ADD_REAL(V_out_st, tmp5, tmp6);
    `MAKE_CONST_REAL(50.4, tmp7);
    `ADD_REAL(V_out_st, tmp7, tmp8);
    `MAKE_CONST_REAL(0.125, tmp9);
    `MUL_REAL(tmp8, tmp9, tmp10);
    `MUL_REAL(tmp6, tmp10, tmp11);
    `MAKE_CONST_REAL(50.4, tmp12);
    `ADD_REAL(V_out_st, tmp12, tmp13);
    `MAKE_CONST_REAL(50.4, tmp14);
    `ADD_REAL(V_out_st, tmp14, tmp15);
    `MAKE_CONST_REAL(50.4, tmp16);
    `ADD_REAL(V_out_st, tmp16, tmp17);
    `MAKE_CONST_REAL(0.020833333333333332, tmp18);
    `MUL_REAL(tmp13, tmp15, tmp19);
    `MUL_REAL(tmp17, tmp18, tmp20);
    `MUL_REAL(tmp19, tmp20, tmp21);
    `MAKE_CONST_REAL(50.4, tmp22);
    `ADD_REAL(V_out_st, tmp22, tmp23);
    `MAKE_CONST_REAL(50.4, tmp24);
    `ADD_REAL(V_out_st, tmp24, tmp25);
    `MAKE_CONST_REAL(50.4, tmp26);
    `ADD_REAL(V_out_st, tmp26, tmp27);
    `MAKE_CONST_REAL(50.4, tmp28);
    `ADD_REAL(V_out_st, tmp28, tmp29);
    `MAKE_CONST_REAL(0.0026041666666666665, tmp30);
    `MUL_REAL(tmp23, tmp25, tmp31);
    `MUL_REAL(tmp29, tmp30, tmp32);
    `MUL_REAL(tmp27, tmp32, tmp33);
    `MUL_REAL(tmp31, tmp33, tmp34);
    `MAKE_CONST_REAL(1.0, tmp35);
    `ADD_REAL(tmp4, tmp11, tmp36);
    `ADD_REAL(tmp34, tmp35, tmp37);
    `ADD_REAL(tmp21, tmp37, tmp38);
    `ADD_REAL(tmp36, tmp38, tmp39);
    `ASSIGN_REAL(tmp39, V_out_exp);
    // Assign signal: V_out_lin
    `ASSIGN_REAL(V_out_st, V_out_lin);
    // Assign signal: V_out_I
    `ASSIGN_REAL(I_in, V_out_I);
    // Assign signal: digital_sel_out
    assign digital_sel_out = digital_sel;
    // Assign signal: V_out_st
    `MAKE_REAL(tmp40, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)+3194490258.0494204)*0.003537318712415989)+1000), 70.6)*1.01));
    `MAKE_CONST_REAL(-70.6, tmp41);
    `NEGATE_REAL(V_out_st, tmp42);
    `MAKE_CONST_REAL(-70.6, tmp43);
    `ADD_REAL(tmp42, tmp43, tmp44);
    `MUL_CONST_REAL(2.82e-06, tmp44, tmp45);
    `MAKE_CONST_REAL(50.4, tmp46);
    `ADD_REAL(V_out_st, tmp46, tmp47);
    `MUL_CONST_REAL(0.5, tmp47, tmp48);
    `MAKE_CONST_REAL(50.4, tmp49);
    `ADD_REAL(V_out_st, tmp49, tmp50);
    `MAKE_CONST_REAL(50.4, tmp51);
    `ADD_REAL(V_out_st, tmp51, tmp52);
    `MAKE_CONST_REAL(0.125, tmp53);
    `MUL_REAL(tmp52, tmp53, tmp54);
    `MUL_REAL(tmp50, tmp54, tmp55);
    `MAKE_CONST_REAL(50.4, tmp56);
    `ADD_REAL(V_out_st, tmp56, tmp57);
    `MAKE_CONST_REAL(50.4, tmp58);
    `ADD_REAL(V_out_st, tmp58, tmp59);
    `MAKE_CONST_REAL(50.4, tmp60);
    `ADD_REAL(V_out_st, tmp60, tmp61);
    `MAKE_CONST_REAL(0.020833333333333332, tmp62);
    `MUL_REAL(tmp57, tmp59, tmp63);
    `MUL_REAL(tmp61, tmp62, tmp64);
    `MUL_REAL(tmp63, tmp64, tmp65);
    `MAKE_CONST_REAL(50.4, tmp66);
    `ADD_REAL(V_out_st, tmp66, tmp67);
    `MAKE_CONST_REAL(50.4, tmp68);
    `ADD_REAL(V_out_st, tmp68, tmp69);
    `MAKE_CONST_REAL(50.4, tmp70);
    `ADD_REAL(V_out_st, tmp70, tmp71);
    `MAKE_CONST_REAL(50.4, tmp72);
    `ADD_REAL(V_out_st, tmp72, tmp73);
    `MAKE_CONST_REAL(0.0026041666666666665, tmp74);
    `MUL_REAL(tmp67, tmp69, tmp75);
    `MUL_REAL(tmp73, tmp74, tmp76);
    `MUL_REAL(tmp71, tmp76, tmp77);
    `MUL_REAL(tmp75, tmp77, tmp78);
    `MAKE_CONST_REAL(1.0, tmp79);
    `ADD_REAL(tmp48, tmp55, tmp80);
    `ADD_REAL(tmp45, tmp80, tmp81);
    `ADD_REAL(tmp65, tmp78, tmp82);
    `ADD_REAL(I_in, tmp79, tmp83);
    `ADD_REAL(tmp82, tmp83, tmp84);
    `ADD_REAL(tmp81, tmp84, tmp85);
    `MUL_CONST_REAL(0.003537318712415989, tmp85, tmp86);
    `ADD_REAL(V_out_st, tmp86, tmp87);
    `MAKE_REAL(tmp88, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)+3194490258.0494204)*0.003537318712415989)+1000), 70.6)*1.01));
    `ASSIGN_REAL(tmp41, tmp88);
    `MAKE_REAL(tmp89, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)+3194490258.0494204)*0.003537318712415989)+1000), 70.6)*1.01));
    `ASSIGN_REAL(tmp87, tmp89);
    always @(*) begin
        case (digital_sel)
            0: tmp40 = tmp88;
            1: tmp40 = tmp89;
            default: tmp40 = 0;
        endcase
    end
    `DFF_INTO_REAL(tmp40, V_out_st, `RST_MSDSL, `CLK_MSDSL, 1'b1, -70.6);
    // Assign signal: V_out_I_mult
    `MAKE_REAL(tmp90, (`MAX_MATH(((`RANGE_PARAM_REAL(I_in)+3194490258.0494204)*0.003537318712415989), 70.6)*1.01));
    `MAKE_CONST_REAL(-70.6, tmp91);
    `NEGATE_REAL(V_out_st, tmp92);
    `MAKE_CONST_REAL(-70.6, tmp93);
    `ADD_REAL(tmp92, tmp93, tmp94);
    `MUL_CONST_REAL(2.82e-06, tmp94, tmp95);
    `MAKE_CONST_REAL(50.4, tmp96);
    `ADD_REAL(V_out_st, tmp96, tmp97);
    `MUL_CONST_REAL(0.5, tmp97, tmp98);
    `MAKE_CONST_REAL(50.4, tmp99);
    `ADD_REAL(V_out_st, tmp99, tmp100);
    `MAKE_CONST_REAL(50.4, tmp101);
    `ADD_REAL(V_out_st, tmp101, tmp102);
    `MAKE_CONST_REAL(0.125, tmp103);
    `MUL_REAL(tmp102, tmp103, tmp104);
    `MUL_REAL(tmp100, tmp104, tmp105);
    `MAKE_CONST_REAL(50.4, tmp106);
    `ADD_REAL(V_out_st, tmp106, tmp107);
    `MAKE_CONST_REAL(50.4, tmp108);
    `ADD_REAL(V_out_st, tmp108, tmp109);
    `MAKE_CONST_REAL(50.4, tmp110);
    `ADD_REAL(V_out_st, tmp110, tmp111);
    `MAKE_CONST_REAL(0.020833333333333332, tmp112);
    `MUL_REAL(tmp107, tmp109, tmp113);
    `MUL_REAL(tmp111, tmp112, tmp114);
    `MUL_REAL(tmp113, tmp114, tmp115);
    `MAKE_CONST_REAL(50.4, tmp116);
    `ADD_REAL(V_out_st, tmp116, tmp117);
    `MAKE_CONST_REAL(50.4, tmp118);
    `ADD_REAL(V_out_st, tmp118, tmp119);
    `MAKE_CONST_REAL(50.4, tmp120);
    `ADD_REAL(V_out_st, tmp120, tmp121);
    `MAKE_CONST_REAL(50.4, tmp122);
    `ADD_REAL(V_out_st, tmp122, tmp123);
    `MAKE_CONST_REAL(0.0026041666666666665, tmp124);
    `MUL_REAL(tmp117, tmp119, tmp125);
    `MUL_REAL(tmp123, tmp124, tmp126);
    `MUL_REAL(tmp121, tmp126, tmp127);
    `MUL_REAL(tmp125, tmp127, tmp128);
    `MAKE_CONST_REAL(1.0, tmp129);
    `ADD_REAL(tmp98, tmp105, tmp130);
    `ADD_REAL(tmp95, tmp130, tmp131);
    `ADD_REAL(tmp115, tmp128, tmp132);
    `ADD_REAL(I_in, tmp129, tmp133);
    `ADD_REAL(tmp132, tmp133, tmp134);
    `ADD_REAL(tmp131, tmp134, tmp135);
    `MUL_CONST_REAL(0.003537318712415989, tmp135, tmp136);
    `MAKE_REAL(tmp137, (`MAX_MATH(((`RANGE_PARAM_REAL(I_in)+3194490258.0494204)*0.003537318712415989), 70.6)*1.01));
    `ASSIGN_REAL(tmp91, tmp137);
    `MAKE_REAL(tmp138, (`MAX_MATH(((`RANGE_PARAM_REAL(I_in)+3194490258.0494204)*0.003537318712415989), 70.6)*1.01));
    `ASSIGN_REAL(tmp136, tmp138);
    always @(*) begin
        case (digital_sel)
            0: tmp90 = tmp137;
            1: tmp90 = tmp138;
            default: tmp90 = 0;
        endcase
    end
    `ASSIGN_REAL(tmp90, V_out_I_mult);
endmodule

`default_nettype wire
