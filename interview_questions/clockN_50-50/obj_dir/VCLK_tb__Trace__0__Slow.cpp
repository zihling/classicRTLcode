// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VCLK_tb__Syms.h"


VL_ATTR_COLD void VCLK_tb___024root__trace_init_sub__TOP__0(VCLK_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_init_sub__TOP__0\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->pushPrefix("CLK_tb", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+7,0,"divider_value",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1,0,"clk",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+2,0,"rst_n",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"new_clk",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("dut", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+7,0,"divider_value",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+2,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"new_clk",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+8,0,"d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBus(c+9,0,"width",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBit(c+4,0,"rise",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+5,0,"fall",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+6,0,"count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+10,0,"D",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void VCLK_tb___024root__trace_init_top(VCLK_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_init_top\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VCLK_tb___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VCLK_tb___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void VCLK_tb___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VCLK_tb___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VCLK_tb___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VCLK_tb___024root__trace_register(VCLK_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_register\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&VCLK_tb___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&VCLK_tb___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&VCLK_tb___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&VCLK_tb___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VCLK_tb___024root__trace_const_0_sub_0(VCLK_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VCLK_tb___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_const_0\n"); );
    // Init
    VCLK_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VCLK_tb___024root*>(voidSelf);
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VCLK_tb___024root__trace_const_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VCLK_tb___024root__trace_const_0_sub_0(VCLK_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_const_0_sub_0\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullIData(oldp+7,(7U),32);
    bufp->fullIData(oldp+8,(6U),32);
    bufp->fullIData(oldp+9,(3U),32);
    bufp->fullCData(oldp+10,(6U),3);
}

VL_ATTR_COLD void VCLK_tb___024root__trace_full_0_sub_0(VCLK_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VCLK_tb___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_full_0\n"); );
    // Init
    VCLK_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VCLK_tb___024root*>(voidSelf);
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VCLK_tb___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VCLK_tb___024root__trace_full_0_sub_0(VCLK_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VCLK_tb___024root__trace_full_0_sub_0\n"); );
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullBit(oldp+1,(vlSelfRef.CLK_tb__DOT__clk));
    bufp->fullBit(oldp+2,(vlSelfRef.CLK_tb__DOT__rst_n));
    bufp->fullBit(oldp+3,(((IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__fall) 
                           | (IData)(vlSelfRef.CLK_tb__DOT__dut__DOT__rise))));
    bufp->fullBit(oldp+4,(vlSelfRef.CLK_tb__DOT__dut__DOT__rise));
    bufp->fullBit(oldp+5,(vlSelfRef.CLK_tb__DOT__dut__DOT__fall));
    bufp->fullCData(oldp+6,(vlSelfRef.CLK_tb__DOT__dut__DOT__count),3);
}
