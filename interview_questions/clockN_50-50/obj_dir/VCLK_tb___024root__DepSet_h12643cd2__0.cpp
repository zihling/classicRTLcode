// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCLK_tb.h for the primary calling header

#include "VCLK_tb__pch.h"
#include "VCLK_tb___024root.h"

VL_ATTR_COLD void VCLK_tb___024root___eval_initial__TOP(VCLK_tb___024root* vlSelf);
VlCoroutine VCLK_tb___024root___eval_initial__TOP__Vtiming__0(VCLK_tb___024root* vlSelf);
VlCoroutine VCLK_tb___024root___eval_initial__TOP__Vtiming__1(VCLK_tb___024root* vlSelf);

void VCLK_tb___024root___eval_initial(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_initial\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VCLK_tb___024root___eval_initial__TOP(vlSelf);
    VCLK_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    VCLK_tb___024root___eval_initial__TOP__Vtiming__1(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__CLK_tb__DOT__clk__0 
        = vlSelfRef.CLK_tb__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__CLK_tb__DOT__rst_n__0 
        = vlSelfRef.CLK_tb__DOT__rst_n;
}

VL_INLINE_OPT VlCoroutine VCLK_tb___024root___eval_initial__TOP__Vtiming__0(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.CLK_tb__DOT__rst_n = 0U;
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         30);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         30);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         30);
    vlSelfRef.CLK_tb__DOT__rst_n = 1U;
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    co_await vlSelfRef.__VtrigSched_h2581fa56__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge CLK_tb.clk)", 
                                                         "CLK_tb.sv", 
                                                         33);
    VL_FINISH_MT("CLK_tb.sv", 35, "");
}

VL_INLINE_OPT VlCoroutine VCLK_tb___024root___eval_initial__TOP__Vtiming__1(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_initial__TOP__Vtiming__1\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (1U) {
        co_await vlSelfRef.__VdlySched.delay(5ULL, 
                                             nullptr, 
                                             "CLK_tb.sv", 
                                             19);
        vlSelfRef.CLK_tb__DOT__clk = (1U & (~ (IData)(vlSelfRef.CLK_tb__DOT__clk)));
    }
}

void VCLK_tb___024root___eval_act(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_act\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void VCLK_tb___024root___nba_sequent__TOP__0(VCLK_tb___024root* vlSelf);
void VCLK_tb___024root___nba_sequent__TOP__1(VCLK_tb___024root* vlSelf);
void VCLK_tb___024root___nba_sequent__TOP__2(VCLK_tb___024root* vlSelf);

void VCLK_tb___024root___eval_nba(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_nba\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VCLK_tb___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((6ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VCLK_tb___024root___nba_sequent__TOP__1(vlSelf);
    }
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VCLK_tb___024root___nba_sequent__TOP__2(vlSelf);
    }
}

VL_INLINE_OPT void VCLK_tb___024root___nba_sequent__TOP__0(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___nba_sequent__TOP__0\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vdly__CLK_tb__DOT__dut__DOT__count 
        = vlSelfRef.CLK_tb__DOT__dut__DOT__count;
    vlSelfRef.__Vdly__CLK_tb__DOT__dut__DOT__count 
        = ((IData)(vlSelfRef.CLK_tb__DOT__rst_n) ? 
           ((6U == (IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__count))
             ? 0U : (7U & ((IData)(1U) + (IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__count))))
            : 0U);
}

VL_INLINE_OPT void VCLK_tb___024root___nba_sequent__TOP__1(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___nba_sequent__TOP__1\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.CLK_tb__DOT__dut__DOT__fall = ((IData)(vlSelfRef.CLK_tb__DOT__rst_n) 
                                             & (IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__rise));
}

VL_INLINE_OPT void VCLK_tb___024root___nba_sequent__TOP__2(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___nba_sequent__TOP__2\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (vlSelfRef.CLK_tb__DOT__rst_n) {
        if ((3U == (IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__count))) {
            vlSelfRef.CLK_tb__DOT__dut__DOT__rise = 1U;
        } else if ((6U == (IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__count))) {
            vlSelfRef.CLK_tb__DOT__dut__DOT__rise = 0U;
        }
    } else {
        vlSelfRef.CLK_tb__DOT__dut__DOT__rise = 0U;
    }
    vlSelfRef.CLK_tb__DOT__dut__DOT__count = vlSelfRef.__Vdly__CLK_tb__DOT__dut__DOT__count;
}

void VCLK_tb___024root___timing_commit(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___timing_commit\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((! (1ULL & vlSelfRef.__VactTriggered.word(0U)))) {
        vlSelfRef.__VtrigSched_h2581fa56__0.commit(
                                                   "@(posedge CLK_tb.clk)");
    }
}

void VCLK_tb___024root___timing_resume(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___timing_resume\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VtrigSched_h2581fa56__0.resume(
                                                   "@(posedge CLK_tb.clk)");
    }
    if ((8ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void VCLK_tb___024root___eval_triggers__act(VCLK_tb___024root* vlSelf);

bool VCLK_tb___024root___eval_phase__act(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_phase__act\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<4> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    VCLK_tb___024root___eval_triggers__act(vlSelf);
    VCLK_tb___024root___timing_commit(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        VCLK_tb___024root___timing_resume(vlSelf);
        VCLK_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VCLK_tb___024root___eval_phase__nba(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_phase__nba\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        VCLK_tb___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VCLK_tb___024root___dump_triggers__nba(VCLK_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VCLK_tb___024root___dump_triggers__act(VCLK_tb___024root* vlSelf);
#endif  // VL_DEBUG

void VCLK_tb___024root___eval(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY(((0x64U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            VCLK_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("CLK_tb.sv", 4, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY(((0x64U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                VCLK_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("CLK_tb.sv", 4, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (VCLK_tb___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (VCLK_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void VCLK_tb___024root___eval_debug_assertions(VCLK_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root___eval_debug_assertions\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
