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
module OR_perdio (
//////////// OUTPUTS //////////
	CC_GATES_z_Out,
//////////// INPUTS //////////
	
	CC_GATES_a_In,
	CC_GATES_b_In,
	CC_GATES_c_In,
	CC_GATES_d_In,
	CC_GATES_e_In,
	CC_GATES_f_In,
	CC_GATES_g_In,
	CC_GATES_h_In,
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	CC_GATES_z_Out;
input 	CC_GATES_a_In;
input 	CC_GATES_b_In;
input 	CC_GATES_c_In;
input 	CC_GATES_d_In;
input 	CC_GATES_e_In;
input 	CC_GATES_f_In;
input 	CC_GATES_g_In;
input 	CC_GATES_h_In;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================


//=======================================================
//  Structural coding
//=======================================================
assign CC_GATES_z_Out = CC_GATES_a_In | CC_GATES_b_In | CC_GATES_c_In | CC_GATES_d_In | CC_GATES_e_In | CC_GATES_f_In | CC_GATES_g_In | CC_GATES_h_In;

endmodule
//=======================================================A/
