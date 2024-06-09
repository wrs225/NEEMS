// Model generated on 2024-06-08 20:15:25.328350

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
    `MAKE_CONST_REAL(50.4, tmp35);
    `ADD_REAL(V_out_st, tmp35, tmp36);
    `MAKE_CONST_REAL(50.4, tmp37);
    `ADD_REAL(V_out_st, tmp37, tmp38);
    `MAKE_CONST_REAL(50.4, tmp39);
    `ADD_REAL(V_out_st, tmp39, tmp40);
    `MAKE_CONST_REAL(50.4, tmp41);
    `ADD_REAL(V_out_st, tmp41, tmp42);
    `MAKE_CONST_REAL(50.4, tmp43);
    `ADD_REAL(V_out_st, tmp43, tmp44);
    `MAKE_CONST_REAL(0.00026041666666666666, tmp45);
    `MUL_REAL(tmp38, tmp40, tmp46);
    `MUL_REAL(tmp36, tmp46, tmp47);
    `MUL_REAL(tmp44, tmp45, tmp48);
    `MUL_REAL(tmp42, tmp48, tmp49);
    `MUL_REAL(tmp47, tmp49, tmp50);
    `MAKE_CONST_REAL(50.4, tmp51);
    `ADD_REAL(V_out_st, tmp51, tmp52);
    `MAKE_CONST_REAL(50.4, tmp53);
    `ADD_REAL(V_out_st, tmp53, tmp54);
    `MAKE_CONST_REAL(50.4, tmp55);
    `ADD_REAL(V_out_st, tmp55, tmp56);
    `MAKE_CONST_REAL(50.4, tmp57);
    `ADD_REAL(V_out_st, tmp57, tmp58);
    `MAKE_CONST_REAL(50.4, tmp59);
    `ADD_REAL(V_out_st, tmp59, tmp60);
    `MAKE_CONST_REAL(50.4, tmp61);
    `ADD_REAL(V_out_st, tmp61, tmp62);
    `MAKE_CONST_REAL(2.170138888888889e-05, tmp63);
    `MUL_REAL(tmp54, tmp56, tmp64);
    `MUL_REAL(tmp52, tmp64, tmp65);
    `MUL_REAL(tmp58, tmp60, tmp66);
    `MUL_REAL(tmp62, tmp63, tmp67);
    `MUL_REAL(tmp66, tmp67, tmp68);
    `MUL_REAL(tmp65, tmp68, tmp69);
    `MAKE_CONST_REAL(1.0, tmp70);
    `ADD_REAL(tmp11, tmp21, tmp71);
    `ADD_REAL(tmp4, tmp71, tmp72);
    `ADD_REAL(tmp34, tmp50, tmp73);
    `ADD_REAL(tmp69, tmp70, tmp74);
    `ADD_REAL(tmp73, tmp74, tmp75);
    `ADD_REAL(tmp72, tmp75, tmp76);
    `MUL_CONST_REAL(2.4965824341506397e-40, tmp76, tmp77);
    `ASSIGN_REAL(tmp77, V_out_exp);
    // Assign signal: V_out_lin
    `ASSIGN_REAL(V_out_st, V_out_lin);
    // Assign signal: V_out_I
    `ASSIGN_REAL(I_in, V_out_I);
    // Assign signal: digital_sel_out
    assign digital_sel_out = digital_sel;
    // Assign signal: V_out_st
    `MAKE_REAL(tmp78, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)+3.361684e-07)*3184713.375796179)+1000), 70.6)*1.01));
    `MAKE_CONST_REAL(-70.6, tmp79);
    `NEGATE_REAL(V_out_st, tmp80);
    `MAKE_CONST_REAL(-70.6, tmp81);
    `ADD_REAL(tmp80, tmp81, tmp82);
    `MUL_CONST_REAL(3.14e-10, tmp82, tmp83);
    `MAKE_CONST_REAL(50.4, tmp84);
    `ADD_REAL(V_out_st, tmp84, tmp85);
    `MUL_CONST_REAL(0.5, tmp85, tmp86);
    `MAKE_CONST_REAL(50.4, tmp87);
    `ADD_REAL(V_out_st, tmp87, tmp88);
    `MAKE_CONST_REAL(50.4, tmp89);
    `ADD_REAL(V_out_st, tmp89, tmp90);
    `MAKE_CONST_REAL(0.125, tmp91);
    `MUL_REAL(tmp90, tmp91, tmp92);
    `MUL_REAL(tmp88, tmp92, tmp93);
    `MAKE_CONST_REAL(50.4, tmp94);
    `ADD_REAL(V_out_st, tmp94, tmp95);
    `MAKE_CONST_REAL(50.4, tmp96);
    `ADD_REAL(V_out_st, tmp96, tmp97);
    `MAKE_CONST_REAL(50.4, tmp98);
    `ADD_REAL(V_out_st, tmp98, tmp99);
    `MAKE_CONST_REAL(0.020833333333333332, tmp100);
    `MUL_REAL(tmp95, tmp97, tmp101);
    `MUL_REAL(tmp99, tmp100, tmp102);
    `MUL_REAL(tmp101, tmp102, tmp103);
    `MAKE_CONST_REAL(50.4, tmp104);
    `ADD_REAL(V_out_st, tmp104, tmp105);
    `MAKE_CONST_REAL(50.4, tmp106);
    `ADD_REAL(V_out_st, tmp106, tmp107);
    `MAKE_CONST_REAL(50.4, tmp108);
    `ADD_REAL(V_out_st, tmp108, tmp109);
    `MAKE_CONST_REAL(50.4, tmp110);
    `ADD_REAL(V_out_st, tmp110, tmp111);
    `MAKE_CONST_REAL(0.0026041666666666665, tmp112);
    `MUL_REAL(tmp105, tmp107, tmp113);
    `MUL_REAL(tmp111, tmp112, tmp114);
    `MUL_REAL(tmp109, tmp114, tmp115);
    `MUL_REAL(tmp113, tmp115, tmp116);
    `MAKE_CONST_REAL(50.4, tmp117);
    `ADD_REAL(V_out_st, tmp117, tmp118);
    `MAKE_CONST_REAL(50.4, tmp119);
    `ADD_REAL(V_out_st, tmp119, tmp120);
    `MAKE_CONST_REAL(50.4, tmp121);
    `ADD_REAL(V_out_st, tmp121, tmp122);
    `MAKE_CONST_REAL(50.4, tmp123);
    `ADD_REAL(V_out_st, tmp123, tmp124);
    `MAKE_CONST_REAL(50.4, tmp125);
    `ADD_REAL(V_out_st, tmp125, tmp126);
    `MAKE_CONST_REAL(0.00026041666666666666, tmp127);
    `MUL_REAL(tmp120, tmp122, tmp128);
    `MUL_REAL(tmp118, tmp128, tmp129);
    `MUL_REAL(tmp126, tmp127, tmp130);
    `MUL_REAL(tmp124, tmp130, tmp131);
    `MUL_REAL(tmp129, tmp131, tmp132);
    `MAKE_CONST_REAL(50.4, tmp133);
    `ADD_REAL(V_out_st, tmp133, tmp134);
    `MAKE_CONST_REAL(50.4, tmp135);
    `ADD_REAL(V_out_st, tmp135, tmp136);
    `MAKE_CONST_REAL(50.4, tmp137);
    `ADD_REAL(V_out_st, tmp137, tmp138);
    `MAKE_CONST_REAL(50.4, tmp139);
    `ADD_REAL(V_out_st, tmp139, tmp140);
    `MAKE_CONST_REAL(50.4, tmp141);
    `ADD_REAL(V_out_st, tmp141, tmp142);
    `MAKE_CONST_REAL(50.4, tmp143);
    `ADD_REAL(V_out_st, tmp143, tmp144);
    `MAKE_CONST_REAL(2.170138888888889e-05, tmp145);
    `MUL_REAL(tmp136, tmp138, tmp146);
    `MUL_REAL(tmp134, tmp146, tmp147);
    `MUL_REAL(tmp140, tmp142, tmp148);
    `MUL_REAL(tmp144, tmp145, tmp149);
    `MUL_REAL(tmp148, tmp149, tmp150);
    `MUL_REAL(tmp147, tmp150, tmp151);
    `MAKE_CONST_REAL(1.0, tmp152);
    `ADD_REAL(tmp93, tmp103, tmp153);
    `ADD_REAL(tmp86, tmp153, tmp154);
    `ADD_REAL(tmp116, tmp132, tmp155);
    `ADD_REAL(tmp151, tmp152, tmp156);
    `ADD_REAL(tmp155, tmp156, tmp157);
    `ADD_REAL(tmp154, tmp157, tmp158);
    `MUL_CONST_REAL(2.4965824341506397e-40, tmp158, tmp159);
    `ADD_REAL(tmp159, I_in, tmp160);
    `ADD_REAL(tmp83, tmp160, tmp161);
    `MUL_CONST_REAL(3184713.375796179, tmp161, tmp162);
    `ADD_REAL(V_out_st, tmp162, tmp163);
    `MAKE_REAL(tmp164, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)+3.361684e-07)*3184713.375796179)+1000), 70.6)*1.01));
    `ASSIGN_REAL(tmp79, tmp164);
    `MAKE_REAL(tmp165, (`MAX_MATH((((`RANGE_PARAM_REAL(I_in)+3.361684e-07)*3184713.375796179)+1000), 70.6)*1.01));
    `ASSIGN_REAL(tmp163, tmp165);
    always @(*) begin
        case (digital_sel)
            0: tmp78 = tmp164;
            1: tmp78 = tmp165;
            default: tmp78 = 0;
        endcase
    end
    `DFF_INTO_REAL(tmp78, V_out_st, `RST_MSDSL, `CLK_MSDSL, 1'b1, -70.6);
    // Assign signal: V_out_I_mult
    `MAKE_REAL(tmp166, (`MAX_MATH(((`RANGE_PARAM_REAL(I_in)+3.361684e-07)*3184713.375796179), 70.6)*1.01));
    `MAKE_CONST_REAL(-70.6, tmp167);
    `NEGATE_REAL(V_out_st, tmp168);
    `MAKE_CONST_REAL(-70.6, tmp169);
    `ADD_REAL(tmp168, tmp169, tmp170);
    `MUL_CONST_REAL(3.14e-10, tmp170, tmp171);
    `MAKE_CONST_REAL(50.4, tmp172);
    `ADD_REAL(V_out_st, tmp172, tmp173);
    `MUL_CONST_REAL(0.5, tmp173, tmp174);
    `MAKE_CONST_REAL(50.4, tmp175);
    `ADD_REAL(V_out_st, tmp175, tmp176);
    `MAKE_CONST_REAL(50.4, tmp177);
    `ADD_REAL(V_out_st, tmp177, tmp178);
    `MAKE_CONST_REAL(0.125, tmp179);
    `MUL_REAL(tmp178, tmp179, tmp180);
    `MUL_REAL(tmp176, tmp180, tmp181);
    `MAKE_CONST_REAL(50.4, tmp182);
    `ADD_REAL(V_out_st, tmp182, tmp183);
    `MAKE_CONST_REAL(50.4, tmp184);
    `ADD_REAL(V_out_st, tmp184, tmp185);
    `MAKE_CONST_REAL(50.4, tmp186);
    `ADD_REAL(V_out_st, tmp186, tmp187);
    `MAKE_CONST_REAL(0.020833333333333332, tmp188);
    `MUL_REAL(tmp183, tmp185, tmp189);
    `MUL_REAL(tmp187, tmp188, tmp190);
    `MUL_REAL(tmp189, tmp190, tmp191);
    `MAKE_CONST_REAL(50.4, tmp192);
    `ADD_REAL(V_out_st, tmp192, tmp193);
    `MAKE_CONST_REAL(50.4, tmp194);
    `ADD_REAL(V_out_st, tmp194, tmp195);
    `MAKE_CONST_REAL(50.4, tmp196);
    `ADD_REAL(V_out_st, tmp196, tmp197);
    `MAKE_CONST_REAL(50.4, tmp198);
    `ADD_REAL(V_out_st, tmp198, tmp199);
    `MAKE_CONST_REAL(0.0026041666666666665, tmp200);
    `MUL_REAL(tmp193, tmp195, tmp201);
    `MUL_REAL(tmp199, tmp200, tmp202);
    `MUL_REAL(tmp197, tmp202, tmp203);
    `MUL_REAL(tmp201, tmp203, tmp204);
    `MAKE_CONST_REAL(50.4, tmp205);
    `ADD_REAL(V_out_st, tmp205, tmp206);
    `MAKE_CONST_REAL(50.4, tmp207);
    `ADD_REAL(V_out_st, tmp207, tmp208);
    `MAKE_CONST_REAL(50.4, tmp209);
    `ADD_REAL(V_out_st, tmp209, tmp210);
    `MAKE_CONST_REAL(50.4, tmp211);
    `ADD_REAL(V_out_st, tmp211, tmp212);
    `MAKE_CONST_REAL(50.4, tmp213);
    `ADD_REAL(V_out_st, tmp213, tmp214);
    `MAKE_CONST_REAL(0.00026041666666666666, tmp215);
    `MUL_REAL(tmp208, tmp210, tmp216);
    `MUL_REAL(tmp206, tmp216, tmp217);
    `MUL_REAL(tmp214, tmp215, tmp218);
    `MUL_REAL(tmp212, tmp218, tmp219);
    `MUL_REAL(tmp217, tmp219, tmp220);
    `MAKE_CONST_REAL(50.4, tmp221);
    `ADD_REAL(V_out_st, tmp221, tmp222);
    `MAKE_CONST_REAL(50.4, tmp223);
    `ADD_REAL(V_out_st, tmp223, tmp224);
    `MAKE_CONST_REAL(50.4, tmp225);
    `ADD_REAL(V_out_st, tmp225, tmp226);
    `MAKE_CONST_REAL(50.4, tmp227);
    `ADD_REAL(V_out_st, tmp227, tmp228);
    `MAKE_CONST_REAL(50.4, tmp229);
    `ADD_REAL(V_out_st, tmp229, tmp230);
    `MAKE_CONST_REAL(50.4, tmp231);
    `ADD_REAL(V_out_st, tmp231, tmp232);
    `MAKE_CONST_REAL(2.170138888888889e-05, tmp233);
    `MUL_REAL(tmp224, tmp226, tmp234);
    `MUL_REAL(tmp222, tmp234, tmp235);
    `MUL_REAL(tmp228, tmp230, tmp236);
    `MUL_REAL(tmp232, tmp233, tmp237);
    `MUL_REAL(tmp236, tmp237, tmp238);
    `MUL_REAL(tmp235, tmp238, tmp239);
    `MAKE_CONST_REAL(1.0, tmp240);
    `ADD_REAL(tmp181, tmp191, tmp241);
    `ADD_REAL(tmp174, tmp241, tmp242);
    `ADD_REAL(tmp204, tmp220, tmp243);
    `ADD_REAL(tmp239, tmp240, tmp244);
    `ADD_REAL(tmp243, tmp244, tmp245);
    `ADD_REAL(tmp242, tmp245, tmp246);
    `MUL_CONST_REAL(2.4965824341506397e-40, tmp246, tmp247);
    `ADD_REAL(tmp247, I_in, tmp248);
    `ADD_REAL(tmp171, tmp248, tmp249);
    `MUL_CONST_REAL(3184713.375796179, tmp249, tmp250);
    `MAKE_REAL(tmp251, (`MAX_MATH(((`RANGE_PARAM_REAL(I_in)+3.361684e-07)*3184713.375796179), 70.6)*1.01));
    `ASSIGN_REAL(tmp167, tmp251);
    `MAKE_REAL(tmp252, (`MAX_MATH(((`RANGE_PARAM_REAL(I_in)+3.361684e-07)*3184713.375796179), 70.6)*1.01));
    `ASSIGN_REAL(tmp250, tmp252);
    always @(*) begin
        case (digital_sel)
            0: tmp166 = tmp251;
            1: tmp166 = tmp252;
            default: tmp166 = 0;
        endcase
    end
    `ASSIGN_REAL(tmp166, V_out_I_mult);
endmodule

`default_nettype wire
