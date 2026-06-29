// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCLK_tb.h for the primary calling header

#include "VCLK_tb__pch.h"
#include "VCLK_tb__Syms.h"
#include "VCLK_tb___024root.h"

VL_ATTR_COLD void VCLK_tb___024root___eval_initial__TOP(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_initial__TOP\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<6>/*191:0*/ __Vtemp_1;
    // Body
    vlSelfRef.CLK_tb__DOT__clk = 0U;
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x6e666967U;
    __Vtemp_1[2U] = 0x725f636fU;
    __Vtemp_1[3U] = 0x76696465U;
    __Vtemp_1[4U] = 0x6b5f6469U;
    __Vtemp_1[5U] = 0x636cU;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(6, __Vtemp_1));
    vlSymsp->_traceDumpOpen();
}
