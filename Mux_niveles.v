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
///Q=======================================================
//  MODULE Definition
//=======================================================
module Mux_niveles #(parameter MUX41_SELECTWIDTH=2,parameter MUX41_DATAWIDTH=8)(
//////////// OUTPUTS //////////
	CC_MUX41_z_Out,
//////////// INPUTS //////////
	CC_MUX41_select_InBUS,
	CC_MUX41_data_InBUS_1,
	CC_MUX41_data_InBUS_2,
	CC_MUX41_data_InBUS_3,
	CC_MUX41_data_InBUS_4
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg [7:0]CC_MUX41_z_Out;
input 	[1:0] CC_MUX41_select_InBUS;
input 	[7:0] CC_MUX41_data_InBUS_1;
input 	[7:0]CC_MUX41_data_InBUS_2;
input 	[7:0] CC_MUX41_data_InBUS_3;
input 	[7:0] CC_MUX41_data_InBUS_4;



//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
   case( CC_MUX41_select_InBUS )
       0 : CC_MUX41_z_Out = CC_MUX41_data_InBUS_1;
       1 : CC_MUX41_z_Out = CC_MUX41_data_InBUS_2;
       2 : CC_MUX41_z_Out = CC_MUX41_data_InBUS_3;
       3 : CC_MUX41_z_Out = CC_MUX41_data_InBUS_4;
       default : CC_MUX41_z_Out = CC_MUX41_data_InBUS_1;       
   endcase
end

endmodule
//=======================================================A/

