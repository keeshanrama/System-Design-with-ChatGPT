module GPT (
    input wire irSensor,       // IR Beam Break Sensor input
    input wire [23:0] toneBus, // 24-bit tone bus for sound frequency
    input wire armSwitch,      // Switch to arm the system
    input wire disarmSwitch,   // Switch to disarm the system
    input wire clk,            // Global clock input
    output reg buzzer,         // Output for LilyPad Buzzer
    output reg [1:0] displayInput,  // 2-bit input for 7-segment display
    output reg [6:0] sevenSegment,  // 7-bit output for 7-segment display
    output reg systemArmed,    // State variable to track system armed status
    output reg disarmedState   // State variable to indicate disarmed state
);

reg alarmActive;              // State variable to track alarm status

// Module instantiations
IRSensorModule ir (irSensor, systemArmed, alarmActive);

AlarmSoundModule alarm (
    .alarmActive(alarmActive),
    .toneBus(toneBus),
    .clk(clk),
    .buzzer(buzzer)
);

SystemControl sc (
    .armSwitch(armSwitch),
    .disarmSwitch(disarmSwitch),
    .clk(clk),
    .systemArmed(systemArmed),
    .disarmedState(disarmedState)
);

// Other module instantiations and logic here...

endmodule
