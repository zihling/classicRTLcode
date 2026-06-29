// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCLK_tb.h for the primary calling header

#include "VCLK_tb__pch.h"
#include "VCLK_tb__Syms.h"
#include "VCLK_tb___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VCLK_tb___024root___dump_triggers__act(VCLK_tb___024root* vlSelf);
#endif  // VL_DEBUG

void VCLK_tb___024root___eval_triggers__act(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_triggers__act\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, ((IData)(vlSelfRef.CLK_tb__DOT__clk) 
                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__CLK_tb__DOT__clk__0))));
    vlSelfRef.__VactTriggered.set(1U, ((~ (IData)(vlSelfRef.CLK_tb__DOT__rst_n)) 
                                       & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__CLK_tb__DOT__rst_n__0)));
    vlSelfRef.__VactTriggered.set(2U, ((~ (IData)(vlSelfRef.CLK_tb__DOT__clk)) 
                                       & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__CLK_tb__DOT__clk__0)));
    vlSelfRef.__VactTriggered.set(3U, vlSelfRef.__VdlySched.awaitingCurrentTime());
    vlSelfRef.__Vtrigprevexpr___TOP__CLK_tb__DOT__clk__0 
        = vlSelfRef.CLK_tb__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__CLK_tb__DOT__rst_n__0 
        = vlSelfRef.CLK_tb__DOT__rst_n;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VCLK_tb___024root___dump_triggers__act(vlSelf);
    }
#endif
}
