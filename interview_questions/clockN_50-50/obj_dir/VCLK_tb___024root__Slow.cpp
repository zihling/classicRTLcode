// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VCLK_tb.h for the primary calling header

#include "VCLK_tb__pch.h"
#include "VCLK_tb__Syms.h"
#include "VCLK_tb___024root.h"

void VCLK_tb___024root___ctor_var_reset(VCLK_tb___024root* vlSelf);

VCLK_tb___024root::VCLK_tb___024root(VCLK_tb__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VCLK_tb___024root___ctor_var_reset(this);
}

void VCLK_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VCLK_tb___024root::~VCLK_tb___024root() {
}
