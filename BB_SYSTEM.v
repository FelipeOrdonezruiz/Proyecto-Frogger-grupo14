/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_display_OutBUS,
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

	BB_SYSTEM_startButton_Out, 
	BB_SYSTEM_upButton_Out,
	BB_SYSTEM_downButton_Out,
	BB_SYSTEM_leftButton_Out,
	BB_SYSTEM_rightButton_Out,
	BB_SYSTEM_TEST0,
	BB_SYSTEM_TEST1,
	BB_SYSTEM_TEST2,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_upButton_InLow,
	BB_SYSTEM_downButton_InLow,
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 8;
 parameter PRESCALER_DATAWIDTH = 23;
 parameter DISPLAY_DATAWIDTH = 12;
 
 parameter DATA_FIXED_INITREGPOINT_7 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_6 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_5 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_4 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_3 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_2 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_1 = 8'b00000000;
 parameter DATA_FIXED_INITREGPOINT_0 = 8'b00010000;
 
 parameter DATA_FIXED_Nivel1_7 = 8'b11100111;
 parameter DATA_FIXED_Nivel1_6 = 8'b11000110;
 parameter DATA_FIXED_Nivel1_5 = 8'b01001000;
 parameter DATA_FIXED_Nivel1_4 = 8'b11000000;
 parameter DATA_FIXED_Nivel1_3 = 8'b00000011;
 parameter DATA_FIXED_Nivel1_2 = 8'b11100000;
 parameter DATA_FIXED_Nivel1_1 = 8'b00000011;
 parameter DATA_FIXED_Nivel1_0 = 8'b00000000;
 
 parameter DATA_FIXED_Nivel2_7 = 8'b01111110;
 parameter DATA_FIXED_Nivel2_6 = 8'b10100101;
 parameter DATA_FIXED_Nivel2_5 = 8'b01100100;
 parameter DATA_FIXED_Nivel2_4 = 8'b11100000;
 parameter DATA_FIXED_Nivel2_3 = 8'b00000111;
 parameter DATA_FIXED_Nivel2_2 = 8'b11100000;
 parameter DATA_FIXED_Nivel2_1 = 8'b00000110;
 parameter DATA_FIXED_Nivel2_0 = 8'b00000000;
 
 parameter DATA_FIXED_Nivel3_7 = 8'b10111010;
 parameter DATA_FIXED_Nivel3_6 = 8'b00111000;
 parameter DATA_FIXED_Nivel3_5 = 8'b10000001;
 parameter DATA_FIXED_Nivel3_4 = 8'b00000110;
 parameter DATA_FIXED_Nivel3_3 = 8'b00000000;
 parameter DATA_FIXED_Nivel3_2 = 8'b11100111;
 parameter DATA_FIXED_Nivel3_1 = 8'b00000000;
 parameter DATA_FIXED_Nivel3_0 = 8'b00000000;
 
 parameter DATA_FIXED_Nivel4_7 = 8'b10101011;
 parameter DATA_FIXED_Nivel4_6 = 8'b11100111;
 parameter DATA_FIXED_Nivel4_5 = 8'b00000000;
 parameter DATA_FIXED_Nivel4_4 = 8'b00110011;
 parameter DATA_FIXED_Nivel4_3 = 8'b01100110;
 parameter DATA_FIXED_Nivel4_2 = 8'b00011100;
 parameter DATA_FIXED_Nivel4_1 = 8'b00111000;
 parameter DATA_FIXED_Nivel4_0 = 8'b00000000;
 
 parameter DATA_FIXED_gano_7 = 8'b00000000;
 parameter DATA_FIXED_gano_6 = 8'b01100110;
 parameter DATA_FIXED_gano_5 = 8'b01100110;
 parameter DATA_FIXED_gano_4 = 8'b00000000;
 parameter DATA_FIXED_gano_3 = 8'b00000000;
 parameter DATA_FIXED_gano_2 = 8'b11000011;
 parameter DATA_FIXED_gano_1 = 8'b01111110;
 parameter DATA_FIXED_gano_0 = 8'b00000000;
 
 parameter DATA_FIXED_perdio_7 = 8'b11000011;
 parameter DATA_FIXED_perdio_6 = 8'b01100110;
 parameter DATA_FIXED_perdio_5 = 8'b00111100;
 parameter DATA_FIXED_perdio_4 = 8'b00011000;
 parameter DATA_FIXED_perdio_3 = 8'b00111100;
 parameter DATA_FIXED_perdio_2 = 8'b01100110;
 parameter DATA_FIXED_perdio_1 = 8'b11000011;
 parameter DATA_FIXED_perdio_0 = 8'b00000000;
 
 parameter DATA_FIXED_nivel_7 = 8'b000000;
 parameter DATA_FIXED_nivel_6 = 8'b00111100;
 parameter DATA_FIXED_nivel_5 = 8'b01111110;
 parameter DATA_FIXED_nivel_4 = 8'b11111111;
 parameter DATA_FIXED_nivel_3 = 8'b00011000;
 parameter DATA_FIXED_nivel_2 = 8'b00011000;
 parameter DATA_FIXED_nivel_1 = 8'b00011000;
 parameter DATA_FIXED_nivel_0 = 8'b00001000;
  
//=======================================================
//  PORT declarations
//=======================================================
output		[DISPLAY_DATAWIDTH-1:0] BB_SYSTEM_display_OutBUS;

output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

output 		BB_SYSTEM_startButton_Out;
output 		BB_SYSTEM_upButton_Out;
output 		BB_SYSTEM_downButton_Out;
output 		BB_SYSTEM_leftButton_Out;
output 		BB_SYSTEM_rightButton_Out;
output 		BB_SYSTEM_TEST0;
output 		BB_SYSTEM_TEST1;
output 		BB_SYSTEM_TEST2;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_upButton_InLow;
input		BB_SYSTEM_downButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_upButton_InLow_cwire;
wire 	BB_SYSTEM_downButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_InLow_cwire;

//POINT
wire	STATEMACHINEPOINT_clear_cwire;
wire	STATEMACHINEPOINT_load0_cwire;
wire	STATEMACHINEPOINT_load1_cwire;
wire	[1:0] STATEMACHINEPOINT_shiftselection_cwire;

wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data0_Out;

//BACKGROUNG
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data7_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
wire [DATAWIDTH_BUS-1:0] RegBACKGTYPE_2_BACKGMATRIX_data0_Out;

wire [PRESCALER_DATAWIDTH-1:0] upSPEEDCOUNTER_data_BUS_wire;
wire SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire;
wire STATEMACHINEBACKG_clear_cwire;
wire STATEMACHINEBACKG_load_cwire;
wire [1:0] STATEMACHINEBACKG_shiftselection_cwire;
wire STATEMACHINEBACKG_upcount_cwire;

//Wires AND
wire AND_wire7;
wire AND_wire6;
wire AND_wire5;
wire AND_wire4;
wire AND_wire3;
wire AND_wire2;
wire AND_wire1;
wire AND_wire0;
wire [7:0]AND_wirein7;

//Wire OR verificadora

wire OR_perdio_wire;

//Wires MUX Nivel

wire [7:0]MUX_wire_nivel0;
wire [7:0]MUX_wire_nivel1;
wire [7:0]MUX_wire_nivel2;
wire [7:0]MUX_wire_nivel3;
wire [7:0]MUX_wire_nivel4;
wire [7:0]MUX_wire_nivel5;
wire [7:0]MUX_wire_nivel6;
wire [7:0]MUX_wire_nivel7;
wire [1:0]Mux_seleccionador_in_wire;

//Wire Register Casas

wire Load_variado_in_wire;
wire Load_inicial_in_wire;
wire [7:0]Data_inBus_variado_wire;

//Wire Comparador Casas

wire [1:0]Comparador_casas_in_wire;

//Wire Comparador Nivel;
wire Gano_in_wire;

//Wire Registros Backgorund
wire Perdio_reg_in_wire;
wire Gano_reg_in_wire;
wire Nivel_reg_in_wire;

//Wire sistema animacion

wire empezar_contar_wire;
wire [23:0]tiempo_animacion_wire;
wire post_animacion_wire;
wire post_animacion_registros_wire;
wire debounce_out_empezar_contar_wire;

//BOTTOMSIDE COMPARATOR
wire BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire;

// GAME
wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;

wire 	[7:0] data_max;
wire 	[2:0] add;

wire [DATAWIDTH_BUS-1:0] upCOUNTER_2_BIN2BCD1_data_BUS_wire;
wire [DISPLAY_DATAWIDTH-1:0] BIN2BCD1_2_SEVENSEG1_data_BUS_wire;

//=======================================================
//  Structural coding
//=======================================================









//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_upButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_upButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_downButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_downButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u4 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);

//######################################################################
//#	POINT
//######################################################################
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_7)) SC_RegPOINTTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_6)) SC_RegPOINTTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_5)) SC_RegPOINTTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_4)) SC_RegPOINTTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_3)) SC_RegPOINTTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_2)) SC_RegPOINTTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_1)) SC_RegPOINTTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out)
);
SC_RegPOINTTYPE #(.RegPOINTTYPE_DATAWIDTH(DATAWIDTH_BUS), .DATA_FIXED_INITREGPOINT(DATA_FIXED_INITREGPOINT_0)) SC_RegPOINTTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegPOINTTYPE_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegPOINTTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegPOINTTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegPOINTTYPE_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegPOINTTYPE_load0_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegPOINTTYPE_load1_InLow(STATEMACHINEPOINT_load1_cwire),
	.SC_RegPOINTTYPE_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegPOINTTYPE_data0_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegPOINTTYPE_data1_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out)
	
);

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEPOINT_clear_OutLow(STATEMACHINEPOINT_clear_cwire), 
	.SC_STATEMACHINEPOINT_load0_OutLow(STATEMACHINEPOINT_load0_cwire), 
	.SC_STATEMACHINEPOINT_load1_OutLow(STATEMACHINEPOINT_load1_cwire), 
	.SC_STATEMACHINEPOINT_shiftselection_Out(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_upButton_InLow(BB_SYSTEM_upButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_downButton_InLow(BB_SYSTEM_downButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_leftButton_InLow(BB_SYSTEM_leftButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_rightButton_InLow(BB_SYSTEM_rightButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_bottomsidecomparator_InLow(BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire),
	.SC_STATEMACHINEPOINT_perdio_InLow(OR_perdio_wire),
	.SC_STATEMACHINEPOINT_nivel_InLow(Load_inicial_in_wire),
	.SC_STATEMACHINEPOINT_gano_InLow(Gano_in_wire),
	.SC_STATEMACHINEPOINT_llego_InLow(Load_variado_in_wire)
);

//######################################################################
//#	BACKGROUND
//######################################################################
SC_RegBACKGTYPE  SC_RegBACKGTYPE_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data7_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MUX_wire_nivel7),
	.SC_RegBACKGTYPE_load_gano_InLow(Gano_reg_in_wire),
	.SC_RegBACKGTYPE_load_perdio_InLow(Perdio_reg_in_wire),
	.SC_RegBACKGTYPE_load_nivel_InLow(Nivel_reg_in_wire),
	//.SC_RegBACKGTYPE_data_perdio_InBUS(DATA_FIXED_perdio_7),
	.SC_RegBACKGTYPE_data_gano_InBUS(DATA_FIXED_gano_7),
	//.SC_RegBACKGTYPE_data_nivel_InBUS(DATA_FIXED_nivel_7),
	.SC_RegBACKGTYPE_load_post_animacion_In(post_animacion_registros_wire)
);
SC_RegBACKGTYPE SC_RegBACKGTYPE_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data6_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MUX_wire_nivel6),
	.SC_RegBACKGTYPE_load_gano_InLow(Gano_reg_in_wire),
	.SC_RegBACKGTYPE_load_perdio_InLow(Perdio_reg_in_wire),
	.SC_RegBACKGTYPE_load_nivel_InLow(Nivel_reg_in_wire),
	//.SC_RegBACKGTYPE_data_perdio_InBUS(DATA_FIXED_perdio_6),
	.SC_RegBACKGTYPE_data_gano_InBUS(DATA_FIXED_gano_6),
	//.SC_RegBACKGTYPE_data_nivel_InBUS(DATA_FIXED_nivel_6),
	.SC_RegBACKGTYPE_load_post_animacion_In(post_animacion_registros_wire)
);
SC_RegBACKGTYPE  SC_RegBACKGTYPE_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data5_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MUX_wire_nivel5),
	.SC_RegBACKGTYPE_load_gano_InLow(Gano_reg_in_wire),
	.SC_RegBACKGTYPE_load_perdio_InLow(Perdio_reg_in_wire),
	.SC_RegBACKGTYPE_load_nivel_InLow(Nivel_reg_in_wire),
	//.SC_RegBACKGTYPE_data_perdio_InBUS(DATA_FIXED_perdio_5),
	.SC_RegBACKGTYPE_data_gano_InBUS(DATA_FIXED_gano_5),
	//.SC_RegBACKGTYPE_data_nivel_InBUS(DATA_FIXED_nivel_5),
	.SC_RegBACKGTYPE_load_post_animacion_In(post_animacion_registros_wire)
);
SC_RegBACKGTYPE  SC_RegBACKGTYPE_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data4_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MUX_wire_nivel4),
	.SC_RegBACKGTYPE_load_gano_InLow(Gano_reg_in_wire),
	.SC_RegBACKGTYPE_load_perdio_InLow(Perdio_reg_in_wire),
	.SC_RegBACKGTYPE_load_nivel_InLow(Nivel_reg_in_wire),
	//.SC_RegBACKGTYPE_data_perdio_InBUS(DATA_FIXED_perdio_4),
	.SC_RegBACKGTYPE_data_gano_InBUS(DATA_FIXED_gano_4),
	//.SC_RegBACKGTYPE_data_nivel_InBUS(DATA_FIXED_nivel_4),
	.SC_RegBACKGTYPE_load_post_animacion_In(post_animacion_registros_wire)
);
SC_RegBACKGTYPE  SC_RegBACKGTYPE_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data3_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MUX_wire_nivel3),
	.SC_RegBACKGTYPE_load_gano_InLow(Gano_reg_in_wire),
	.SC_RegBACKGTYPE_load_perdio_InLow(Perdio_reg_in_wire),
	.SC_RegBACKGTYPE_load_nivel_InLow(Nivel_reg_in_wire),
	//.SC_RegBACKGTYPE_data_perdio_InBUS(DATA_FIXED_perdio_3),
	.SC_RegBACKGTYPE_data_gano_InBUS(DATA_FIXED_gano_3),
	//.SC_RegBACKGTYPE_data_nivel_InBUS(DATA_FIXED_nivel_3),
	.SC_RegBACKGTYPE_load_post_animacion_In(post_animacion_registros_wire)
);
SC_RegBACKGTYPE  SC_RegBACKGTYPE_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data2_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MUX_wire_nivel2),
	.SC_RegBACKGTYPE_load_gano_InLow(Gano_reg_in_wire),
	//.SC_RegBACKGTYPE_load_perdio_InLow(Perdio_reg_in_wire),
	.SC_RegBACKGTYPE_load_nivel_InLow(Nivel_reg_in_wire),
	//.SC_RegBACKGTYPE_data_perdio_InBUS(DATA_FIXED_perdio_2),
	.SC_RegBACKGTYPE_data_gano_InBUS(DATA_FIXED_gano_2),
	//.SC_RegBACKGTYPE_data_nivel_InBUS(DATA_FIXED_nivel_2),
	.SC_RegBACKGTYPE_load_post_animacion_In(post_animacion_registros_wire)
);
SC_RegBACKGTYPE  SC_RegBACKGTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MUX_wire_nivel1),
	.SC_RegBACKGTYPE_load_gano_InLow(Gano_reg_in_wire),
	.SC_RegBACKGTYPE_load_perdio_InLow(Perdio_reg_in_wire),
	.SC_RegBACKGTYPE_load_nivel_InLow(Nivel_reg_in_wire),
	//.SC_RegBACKGTYPE_data_perdio_InBUS(DATA_FIXED_perdio_1),
	.SC_RegBACKGTYPE_data_gano_InBUS(DATA_FIXED_gano_1),
	//.SC_RegBACKGTYPE_data_nivel_InBUS(DATA_FIXED_nivel_1),
	.SC_RegBACKGTYPE_load_post_animacion_In(post_animacion_registros_wire)
);
SC_RegBACKGTYPE  SC_RegBACKGTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegBACKGTYPE_data_OutBUS(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
	.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire),	
	.SC_RegBACKGTYPE_load_InLow(STATEMACHINEBACKG_load_cwire),
	.SC_RegBACKGTYPE_shiftselection_In(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_RegBACKGTYPE_data_InBUS(MUX_wire_nivel0),
	.SC_RegBACKGTYPE_load_gano_InLow(Gano_reg_in_wire),
	.SC_RegBACKGTYPE_load_perdio_InLow(Perdio_reg_in_wire),
	.SC_RegBACKGTYPE_load_nivel_InLow(Nivel_reg_in_wire),
	//.SC_RegBACKGTYPE_data_perdio_InBUS(DATA_FIXED_perdio_0),
	.SC_RegBACKGTYPE_data_gano_InBUS(DATA_FIXED_gano_0),
	//.SC_RegBACKGTYPE_data_nivel_InBUS(DATA_FIXED_nivel_0),
	.SC_RegBACKGTYPE_load_post_animacion_In(post_animacion_registros_wire)
);
SC_STATEMACHINEBACKG SC_STATEMACHINEBACKG_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEBACKG_clear_OutLow(STATEMACHINEBACKG_clear_cwire), 
	.SC_STATEMACHINEBACKG_load_OutLow(STATEMACHINEBACKG_load_cwire), 
	.SC_STATEMACHINEBACKG_shiftselection_Out(STATEMACHINEBACKG_shiftselection_cwire),
	.SC_STATEMACHINEBACKG_upcount_out(STATEMACHINEBACKG_upcount_cwire),
	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEBACKG_T0_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	//.SC_STATEMACHINEBACKG_perdio_InLow(OR_perdio_wire),
	.SC_STATEMACHINEBACKG_gano_InLow(Gano_in_wire),
	.SC_STATEMACHINEBACKG_nivel_InLow(Load_inicial_in_wire),
	.SC_STATEMACHINEBACKG_perdio_out(Perdio_reg_in_wire),
	.SC_STATEMACHINEBACKG_gano_out(Gano_reg_in_wire),
	.SC_STATEMACHINEBACKG_nivel_out(Nivel_reg_in_wire),
	.SC_STATEMACHINEBACKG_loadinicial_InLow(Nivel_reg_in_wire),
	.SC_STATEMACHINEBACKG_duracion_animacion_out(empezar_contar_wire),
	.SC_STATEMACHINEBACKG_animacion_inLow(post_animacion_wire),
	.SC_STATEMACHINEBACKG_load_post_animacion_out(post_animacion_registros_wire)
	
);

//#SPEED
SC_upSPEEDCOUNTER #(.upSPEEDCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upSPEEDCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_data_OutBUS(upSPEEDCOUNTER_data_BUS_wire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINEBACKG_upcount_cwire)
);

CC_SPEEDCOMPARATOR #(.SPEEDCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_SPEEDCOMPARATOR_u0 (
	.CC_SPEEDCOMPARATOR_T0_OutLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.CC_SPEEDCOMPARATOR_data_InBUS(upSPEEDCOUNTER_data_BUS_wire),
	.CC_SPEEDCOMPARATOR_Nivel_In(Comparador_casas_in_wire)
);

//######################################################################
//#	COMPARATOR END OF MATRIX (BOTTON SIDE)
//######################################################################
CC_BOTTOMSIDECOMPARATOR #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) CC_BOTTOMSIDECOMPARATOR_u0 (
	.CC_BOTTOMSIDECOMPARATOR_bottomside_OutLow(BOTTOMSIDECOMPARATOR_2_STATEMACHINEBACKG_bottomside_cwire),
	.CC_BOTTOMSIDECOMPARATOR_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out)
);


//######################################################################
//#   Compuertas AND perdio
//######################################################################
AND_perdio AND_reg7(
.CC_GateAND_a_In(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
.CC_GateAND_b_In(AND_wirein7),
.CC_GateAND_z_Out(AND_wire7)
);
AND_perdio AND_reg6(
.CC_GateAND_a_In(RegBACKGTYPE_2_BACKGMATRIX_data6_Out),
.CC_GateAND_b_In(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
.CC_GateAND_z_Out(AND_wire6)
);
AND_perdio AND_reg5(
.CC_GateAND_a_In(RegBACKGTYPE_2_BACKGMATRIX_data5_Out),
.CC_GateAND_b_In(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
.CC_GateAND_z_Out(AND_wire5)
);
AND_perdio AND_reg4(
.CC_GateAND_a_In(RegBACKGTYPE_2_BACKGMATRIX_data4_Out),
.CC_GateAND_b_In(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
.CC_GateAND_z_Out(AND_wire4)
);
AND_perdio AND_reg3(
.CC_GateAND_a_In(RegBACKGTYPE_2_BACKGMATRIX_data3_Out),
.CC_GateAND_b_In(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
.CC_GateAND_z_Out(AND_wire3)
);
AND_perdio AND_reg2(
.CC_GateAND_a_In(RegBACKGTYPE_2_BACKGMATRIX_data2_Out),
.CC_GateAND_b_In(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
.CC_GateAND_z_Out(AND_wire2)
);
AND_perdio AND_reg1(
.CC_GateAND_a_In(RegBACKGTYPE_2_BACKGMATRIX_data1_Out),
.CC_GateAND_b_In(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
.CC_GateAND_z_Out(AND_wire1)
);
AND_perdio AND_reg0(
.CC_GateAND_a_In(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
.CC_GateAND_b_In(RegBACKGTYPE_2_BACKGMATRIX_data0_Out),
.CC_GateAND_z_Out(AND_wire0)
);
//######################################################################
//# Compuerta OR perdio
//######################################################################
OR_perdio OR_verificadora(
.CC_GATES_a_In(AND_wire0),
.CC_GATES_b_In(AND_wire1),
.CC_GATES_c_In(AND_wire2),
.CC_GATES_d_In(AND_wire3),
.CC_GATES_e_In(AND_wire4),
.CC_GATES_f_In(AND_wire5),
.CC_GATES_g_In(AND_wire6),
.CC_GATES_h_In(AND_wire7),
.CC_GATES_z_Out(OR_perdio_wire)

);
//######################################################################
//# Registro y Comparador Casas
//######################################################################
Registro_casas Registro_casasu0(
.SC_RegBACKGTYPE_data_OutBUS(AND_wirein7),
.SC_RegBACKGTYPE_dataInicial_InBUS(MUX_wire_nivel7),
.SC_RegBACKGTYPE_loadVariado_InLow(Load_variado_in_wire),
.SC_RegBACKGTYPE_loadInicial_InLow(STATEMACHINEBACKG_load_cwire),
.SC_RegBACKGTYPE_dataVariada_InBUS(Data_inBus_variado_wire),
.SC_RegBACKGTYPE_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegBACKGTYPE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_RegBACKGTYPE_clear_InLow(STATEMACHINEBACKG_clear_cwire)

);

Comparador_casas Comparador_casasu0(
.CC_Comparadorcasas_T0_OutLow(Load_inicial_in_wire),
.CC_Comparadorcasasin_data_InBUS(AND_wirein7)
);
OR_Registro_casas OR_Variado0 (
.CC_GATES_a_In(AND_wirein7),
.CC_GATES_b_In(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
.CC_GATES_z_Out(Data_inBus_variado_wire)

);
//######################################################################
//# Sistema de Niveles
//######################################################################
Sumador_nivel Sumador_niv (
.SC_upCOUNTER_upcount_InLow(Load_inicial_in_wire),
.SC_upCOUNTER_data_OutBUS(Comparador_casas_in_wire),
.SC_upCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_upCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh)

);
Comparador_nivel  comp_u0(
.CC_SPEEDCOMPARATOR_data_InBUS(Comparador_casas_in_wire),
.CC_SPEEDCOMPARATOR_T0_OutLow(Gano_in_wire)
);




//######################################################################
//# MUX Niveles
//######################################################################
Mux_niveles MUX_Niv0(
.CC_MUX41_z_Out(MUX_wire_nivel0),
.CC_MUX41_select_InBUS(Comparador_casas_in_wire),
.CC_MUX41_data_InBUS_1(DATA_FIXED_Nivel1_0),
.CC_MUX41_data_InBUS_2(DATA_FIXED_Nivel2_0),
.CC_MUX41_data_InBUS_3(DATA_FIXED_Nivel3_0),
.CC_MUX41_data_InBUS_4(DATA_FIXED_Nivel4_0)
);
Mux_niveles MUX_Niv1(
.CC_MUX41_z_Out(MUX_wire_nivel1),
.CC_MUX41_select_InBUS(Comparador_casas_in_wire),
.CC_MUX41_data_InBUS_1(DATA_FIXED_Nivel1_1),
.CC_MUX41_data_InBUS_2(DATA_FIXED_Nivel2_1),
.CC_MUX41_data_InBUS_3(DATA_FIXED_Nivel3_1),
.CC_MUX41_data_InBUS_4(DATA_FIXED_Nivel4_1)
);
Mux_niveles MUX_Niv2(
.CC_MUX41_z_Out(MUX_wire_nivel2),
.CC_MUX41_select_InBUS(Comparador_casas_in_wire),
.CC_MUX41_data_InBUS_1(DATA_FIXED_Nivel1_2),
.CC_MUX41_data_InBUS_2(DATA_FIXED_Nivel2_2),
.CC_MUX41_data_InBUS_3(DATA_FIXED_Nivel3_2),
.CC_MUX41_data_InBUS_4(DATA_FIXED_Nivel4_2)
);
Mux_niveles MUX_Niv3(
.CC_MUX41_z_Out(MUX_wire_nivel3),
.CC_MUX41_select_InBUS(Comparador_casas_in_wire),
.CC_MUX41_data_InBUS_1(DATA_FIXED_Nivel1_3),
.CC_MUX41_data_InBUS_2(DATA_FIXED_Nivel2_3),
.CC_MUX41_data_InBUS_3(DATA_FIXED_Nivel3_3),
.CC_MUX41_data_InBUS_4(DATA_FIXED_Nivel4_3)
);
Mux_niveles MUX_Niv4(
.CC_MUX41_z_Out(MUX_wire_nivel4),
.CC_MUX41_select_InBUS(Comparador_casas_in_wire),
.CC_MUX41_data_InBUS_1(DATA_FIXED_Nivel1_4),
.CC_MUX41_data_InBUS_2(DATA_FIXED_Nivel2_4),
.CC_MUX41_data_InBUS_3(DATA_FIXED_Nivel3_4),
.CC_MUX41_data_InBUS_4(DATA_FIXED_Nivel4_4)

);
Mux_niveles MUX_Niv5(
.CC_MUX41_z_Out(MUX_wire_nivel5),
.CC_MUX41_select_InBUS(Comparador_casas_in_wire),
.CC_MUX41_data_InBUS_1(DATA_FIXED_Nivel1_5),
.CC_MUX41_data_InBUS_2(DATA_FIXED_Nivel2_5),
.CC_MUX41_data_InBUS_3(DATA_FIXED_Nivel3_5),
.CC_MUX41_data_InBUS_4(DATA_FIXED_Nivel4_5)
);
Mux_niveles MUX_Niv6(
.CC_MUX41_z_Out(MUX_wire_nivel6),
.CC_MUX41_select_InBUS(Comparador_casas_in_wire),
.CC_MUX41_data_InBUS_1(DATA_FIXED_Nivel1_6),
.CC_MUX41_data_InBUS_2(DATA_FIXED_Nivel2_6),
.CC_MUX41_data_InBUS_3(DATA_FIXED_Nivel3_6),
.CC_MUX41_data_InBUS_4(DATA_FIXED_Nivel4_6)
);
Mux_niveles MUX_Niv7(
.CC_MUX41_z_Out(MUX_wire_nivel7),
.CC_MUX41_select_InBUS(Comparador_casas_in_wire),
.CC_MUX41_data_InBUS_1(DATA_FIXED_Nivel1_7),
.CC_MUX41_data_InBUS_2(DATA_FIXED_Nivel2_7),
.CC_MUX41_data_InBUS_3(DATA_FIXED_Nivel3_7),
.CC_MUX41_data_InBUS_4(DATA_FIXED_Nivel4_7)
);
//######################################################################
//#Comparador Registro0
//######################################################################
Comparador_Registro0 Comparador_R0 (
.CC_SPEEDCOMPARATOR_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
.CC_SPEEDCOMPARATOR_T0_OutLow(Load_variado_in_wire)
);
//######################################################################
//#Sistema animacion
//######################################################################
Contador_animacion Cont_animacion (
.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_upSPEEDCOUNTER_Contar_InLow(debounce_out_empezar_contar_wire),
.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINEBACKG_upcount_cwire),
.SC_upSPEEDCOUNTER_data_OutBUS(tiempo_animacion_wire)
);

Comparador_animacion comp_animacion (
.CC_SPEEDCOMPARATOR_data_InBUS(tiempo_animacion_wire),
.CC_SPEEDCOMPARATOR_T0_OutLow(post_animacion_wire)
);

SC_DEBOUNCE1 Debounce_reset_cont_niv (
.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50), 
.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_DEBOUNCE1_button_In(empezar_contar_wire),
.SC_DEBOUNCE1_button_Out(debounce_out_empezar_contar_wire)

);
//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = RegPOINTTYPE_2_POINTMATRIX_data0_Out | RegBACKGTYPE_2_BACKGMATRIX_data0_Out;
assign regGAME_data1_wire = RegPOINTTYPE_2_POINTMATRIX_data1_Out | RegBACKGTYPE_2_BACKGMATRIX_data1_Out;
assign regGAME_data2_wire = RegPOINTTYPE_2_POINTMATRIX_data2_Out | RegBACKGTYPE_2_BACKGMATRIX_data2_Out;
assign regGAME_data3_wire = RegPOINTTYPE_2_POINTMATRIX_data3_Out | RegBACKGTYPE_2_BACKGMATRIX_data3_Out;
assign regGAME_data4_wire = RegPOINTTYPE_2_POINTMATRIX_data4_Out | RegBACKGTYPE_2_BACKGMATRIX_data4_Out;
assign regGAME_data5_wire = RegPOINTTYPE_2_POINTMATRIX_data5_Out | RegBACKGTYPE_2_BACKGMATRIX_data5_Out;
assign regGAME_data6_wire = RegPOINTTYPE_2_POINTMATRIX_data6_Out | RegBACKGTYPE_2_BACKGMATRIX_data6_Out;
assign regGAME_data7_wire = RegPOINTTYPE_2_POINTMATRIX_data7_Out | AND_wirein7;

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};
									 
matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 ); 
 
//~ imagen img1(
//~ .act_add(add), 
//~ .max_in(data_max) );

//~ SC_CTRLMATRIX SC_CTRLMATRIX_u0( 
//~ .SC_CTRLMATRIX_max7219DIN_Out(BB_SYSTEM_max7219DIN_Out),	//max7219_din 
//~ .SC_CTRLMATRIX_max7219NCS_out(BB_SYSTEM_max7219NCS_Out),	//max7219_ncs 
//~ .SC_CTRLMATRIX_max7219CLK_Out(BB_SYSTEM_max7219CLK_Out),	//max7219_clk
//~ .SC_CTRLMATRIX_dispdata(data_max), 
//~ .SC_CTRLMATRIX_dispaddr(add),
//~ .SC_CTRLMATRIX_intensity(4'hA),
//~ .SC_CTRLMATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
//~ .SC_CTRLMATRIX_RESET_InHigh(~BB_SYSTEM_RESET_InHigh) 		//~lowRst_System
 //~ ); 
 
//~ SC_IMAGE SC_IMAGE_u0(
//~ .SC_IMAGE_actadd(add), 
//~ .SC_IMAGE_maxin(data_max) );

//######################################################################
//#	TO TEST
//######################################################################

assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_upButton_Out = BB_SYSTEM_upButton_InLow_cwire;
assign BB_SYSTEM_downButton_Out = BB_SYSTEM_downButton_InLow_cwire;
assign BB_SYSTEM_leftButton_Out = BB_SYSTEM_leftButton_InLow_cwire;
assign BB_SYSTEM_rightButton_Out = BB_SYSTEM_rightButton_InLow_cwire;
//TO TEST
assign BB_SYSTEM_TEST0 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST1 = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_TEST2 = BB_SYSTEM_startButton_InLow_cwire;

//######################################################################
//#	TO 7SEG
//######################################################################

CC_BIN2BCD1 CC_BIN2BCD1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_BIN2BCD_bcd_OutBUS(BIN2BCD1_2_SEVENSEG1_data_BUS_wire),
	.CC_BIN2BCD_bin_InBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire)
);

CC_SEVENSEG1 CC_SEVENSEG1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_SEVENSEG1_an(BB_SYSTEM_display_OutBUS[11:8]),
	.CC_SEVENSEG1_a(BB_SYSTEM_display_OutBUS[0]),
	.CC_SEVENSEG1_b(BB_SYSTEM_display_OutBUS[1]),
	.CC_SEVENSEG1_c(BB_SYSTEM_display_OutBUS[2]),
	.CC_SEVENSEG1_d(BB_SYSTEM_display_OutBUS[3]),
	.CC_SEVENSEG1_e(BB_SYSTEM_display_OutBUS[4]),
	.CC_SEVENSEG1_f(BB_SYSTEM_display_OutBUS[5]),
	.CC_SEVENSEG1_g(BB_SYSTEM_display_OutBUS[6]),
	.CC_SEVENSEG1_dp(BB_SYSTEM_display_OutBUS[7]),
	.CC_SEVENSEG1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.CC_SEVENSEG1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.CC_SEVENSEG1_in0(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[3:0]),
	.CC_SEVENSEG1_in1(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[7:4]),
	.CC_SEVENSEG1_in2(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8]),
	.CC_SEVENSEG1_in3(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8])
);

SC_upCOUNTER #(.upCOUNTER_DATAWIDTH(DATAWIDTH_BUS)) SC_upCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upCOUNTER_data_OutBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire),
	.SC_upCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upCOUNTER_upcount_InLow(STATEMACHINEPOINT_load0_cwire)
);

endmodule
