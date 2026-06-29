// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VCLK_tb__Syms.h"


void VCLK_tb___024root__trace_chg_0_sub_0(VCLK_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void VCLK_tb___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_chg_0\n"); );
    // Init
    VCLK_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VCLK_tb___024root*>(voidSelf);
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    VCLK_tb___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void VCLK_tb___024root__trace_chg_0_sub_0(VCLK_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_chg_0_sub_0\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    bufp->chgBit(oldp+0,(vlSelfRef.CLK_tb__DOT__clk));
    bufp->chgBit(oldp+1,(vlSelfRef.CLK_tb__DOT__rst_n));
    bufp->chgBit(oldp+2,(((IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__fall) 
                          | (IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__rise))));
    bufp->chgBit(oldp+3,(vlSelfRef.CLK_tb__DOT__dut__DOT__rise));
    bufp->chgBit(oldp+4,(vlSelfRef.CLK_tb__DOT__dut__DOT__fall));
    bufp->chgCData(oldp+5,(vlSelfRef.CLK_tb__DOT__dut__DOT__count),3);
}

void VCLK_tb___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_cleanup\n"); );
    // Init
    VCLK_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VCLK_tb___024root*>(voidSelf);
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VlUnpacked<CData/*0:0*/, 1> __Vm_traceActivity;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        __Vm_traceActivity[__Vi0] = 0;
    }
    // Body
    vlSymsp->__Vm_activity = false;
    __Vm_traceActivity[0U] = 0U;
}
