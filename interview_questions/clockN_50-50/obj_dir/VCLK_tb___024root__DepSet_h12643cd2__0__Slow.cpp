// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCLK_tb.h for the primary calling header

#include "VCLK_tb__pch.h"
#include "VCLK_tb___024root.h"

VL_ATTR_COLD void VCLK_tb___024root___eval_static(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_static\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VCLK_tb___024root___eval_final(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_final\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VCLK_tb___024root___eval_settle(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_settle\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VCLK_tb___024root___dump_triggers__act(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___dump_triggers__act\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge CLK_tb.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(negedge CLK_tb.rst_n)\n");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @(negedge CLK_tb.clk)\n");
    }
    if ((8ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 3 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void VCLK_tb___024root___dump_triggers__nba(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___dump_triggers__nba\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge CLK_tb.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(negedge CLK_tb.rst_n)\n");
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @(negedge CLK_tb.clk)\n");
    }
    if ((8ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 3 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VCLK_tb___024root___ctor_var_reset(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___ctor_var_reset\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->CLK_tb__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->CLK_tb__DOT__rst_n = VL_RAND_RESET_I(1);
    vlSelf->CLK_tb__DOT__dut__DOT__rise = VL_RAND_RESET_I(1);
    vlSelf->CLK_tb__DOT__dut__DOT__fall = VL_RAND_RESET_I(1);
    vlSelf->CLK_tb__DOT__dut__DOT__count = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__CLK_tb__DOT__dut__DOT__count = VL_RAND_RESET_I(3);
    vlSelf->__Vtrigprevexpr___TOP__CLK_tb__DOT__clk__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__CLK_tb__DOT__rst_n__0 = VL_RAND_RESET_I(1);
}
