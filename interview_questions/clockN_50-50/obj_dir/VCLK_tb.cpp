// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VCLK_tb__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VCLK_tb::VCLK_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VCLK_tb__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

VCLK_tb::VCLK_tb(const char* _vcname__)
    : VCLK_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VCLK_tb::~VCLK_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VCLK_tb___024root___eval_debug_assertions(VCLK_tb___024root* vlSelf);
#endif  // VL_DEBUG
void VCLK_tb___024root___eval_static(VCLK_tb___024root* vlSelf);
void VCLK_tb___024root___eval_initial(VCLK_tb___024root* vlSelf);
void VCLK_tb___024root___eval_settle(VCLK_tb___024root* vlSelf);
void VCLK_tb___024root___eval(VCLK_tb___024root* vlSelf);

void VCLK_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VCLK_tb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VCLK_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VCLK_tb___024root___eval_static(&(vlSymsp->TOP));
        VCLK_tb___024root___eval_initial(&(vlSymsp->TOP));
        VCLK_tb___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VCLK_tb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

void VCLK_tb::eval_end_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+eval_end_step VCLK_tb::eval_end_step\n"); );
#ifdef VM_TRACE
    // Tracing
    if (VL_UNLIKELY(vlSymsp->__Vm_dumping)) vlSymsp->_traceDump();
#endif  // VM_TRACE
}

//============================================================
// Events and timing
bool VCLK_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t VCLK_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* VCLK_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VCLK_tb___024root___eval_final(VCLK_tb___024root* vlSelf);

VL_ATTR_COLD void VCLK_tb::final() {
    VCLK_tb___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VCLK_tb::hierName() const { return vlSymsp->name(); }
const char* VCLK_tb::modelName() const { return "VCLK_tb"; }
unsigned VCLK_tb::threads() const { return 1; }
void VCLK_tb::prepareClone() const { contextp()->prepareClone(); }
void VCLK_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> VCLK_tb::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void VCLK_tb___024root__trace_decl_types(VerilatedVcd* tracep);

void VCLK_tb___024root__trace_init_top(VCLK_tb___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VCLK_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VCLK_tb___024root*>(voidSelf);
    VCLK_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    VCLK_tb___024root__trace_decl_types(tracep);
    VCLK_tb___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void VCLK_tb___024root__trace_register(VCLK_tb___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VCLK_tb::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'VCLK_tb::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    VCLK_tb___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
