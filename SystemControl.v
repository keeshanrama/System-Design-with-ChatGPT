module SystemControl (
    input wire armSwitch,      // Switch to arm the system
    input wire disarmSwitch,   // Switch to disarm the system
    input wire clk,            // Global clock input
    output reg systemArmed,    // State variable to track system armed status
    output reg disarmedState   // State variable to indicate disarmed state
);

always @(posedge clk) begin
    // Update systemArmed and disarmedState based on switch inputs
    if (armSwitch == 1 && disarmSwitch == 0) begin
        // Arm the system when armSwitch is on and disarmSwitch is off
        systemArmed <= 1;
        disarmedState <= 0;
    end
    else if (armSwitch == 0 && disarmSwitch == 1) begin
        // Disarm the system when disarmSwitch is on and armSwitch is off
        systemArmed <= 0;
        disarmedState <= 1;
    end
    // If both switches are off, maintain the current state
end

endmodule
