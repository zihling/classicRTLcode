# Handshake for synchronization

## CDC Handshake Data Transfer (VL60)

### Problem Statement

Design a data sender (data_driver) and a data receiver (data_receiver) operating in different clock domains.

* Sender clock: clk_a
* Receiver clock: clk_b
* clk_a and clk_b have different frequencies.
* The sender continuously transmits values 0 → 7 → 0 → 7 …
* After each successful transfer, the sender waits 5 cycles of clk_a before sending the next value.
* Handshake signals must be used to guarantee that no data is lost during clock-domain crossing.

### Interface

#### Sender (data_driver)

Inputs:

```verilog
clk_a
rst_n
data_ack
```

Outputs:

```verilog
data [2:0]
data_req
```

#### Receiver (data_receiver)

Inputs:

```verilog
clk_b
rst_n
data_req
data [2:0]
```

Outputs:

```verilog
data_ack
```

## Handshake Protocol

A handshake protocol is a communication mechanism used between two modules to guarantee reliable data transfer.

### Request Signal

The source (sender) asserts a request signal to indicate that valid data is available.

While the request remains asserted:

* The data must remain stable.

* The source must not modify the data.

* The source waits for an acknowledgment from the destination.

### Acknowledge Signal

The destination (receiver) asserts an acknowledge signal after successfully capturing the data.

The acknowledge signal informs the source that the transfer has completed.

### Transfer Completion

A transaction is considered complete when:

1. The source presents valid data and asserts the request signal.

2. The destination captures the data and asserts the acknowledge signal.

3. The source detects the acknowledge signal and deasserts the request signal.

4. The destination deasserts the acknowledge signal.

5. The source is now free to modify the data and initiate the next transfer.

### Key Property

The request signal must remain asserted until the acknowledgment is received.

This guarantees that the destination will eventually observe the request, even when the source and destination operate in different clock domains.

## Handshake for Clock Domain Crossing (CDC)

In CDC designs, handshake protocols are commonly used to transfer data between independent clock domains.

Instead of transmitting a short pulse, the source holds the request signal until an acknowledgment is received. This prevents events from being missed due to clock frequency differences.

Typical CDC handshake signals:

* `req` : request / valid
* `ack` : acknowledge / ready

The request and acknowledge signals are usually synchronized using two-flop synchronizers, while the data bus is held stable throughout the transaction.
