// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VCLK_tb.h for the primary calling header

#ifndef VERILATED_VCLK_TB___024ROOT_H_
#define VERILATED_VCLK_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class VCLK_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VCLK_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ CLK_tb__DOT__clk;
    CData/*0:0*/ CLK_tb__DOT__rst_n;
    CData/*0:0*/ CLK_tb__DOT__dut__DOT__rise;
    CData/*0:0*/ CLK_tb__DOT__dut__DOT__fall;
    CData/*2:0*/ CLK_tb__DOT__dut__DOT__count;
    CData/*2:0*/ __Vdly__CLK_tb__DOT__dut__DOT__count;
    CData/*0:0*/ __Vtrigprevexpr___TOP__CLK_tb__DOT__clk__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__CLK_tb__DOT__rst_n__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerScheduler __VtrigSched_h2581fa56__0;
    VlTriggerVec<4> __VactTriggered;
    VlTriggerVec<4> __VnbaTriggered;

    // INTERNAL VARIABLES
    VCLK_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    VCLK_tb___024root(VCLK_tb__Syms* symsp, const char* v__name);
    ~VCLK_tb___024root();
    VL_UNCOPYABLE(VCLK_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
