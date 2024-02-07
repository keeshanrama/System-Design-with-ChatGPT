module AlarmSoundModule (
    input wire alarmActive, // Input to indicate if the alarm is active
    input wire [23:0] toneBus, // 24-bit tone bus for sound frequency
    input wire clk,         // Global clock input
    output reg buzzer       // Output for LilyPad Buzzer
);

reg [14:0] soundCounter;   // 15-bit counter for sound generation

always @(posedge clk) begin
    // Clock the buzzer control logic
    if (alarmActive == 1) begin
        // If alarm is active, generate sound with the LilyPad Buzzer
        if (soundCounter == 15'd0) begin
            buzzer <= toneBus[0];  // Output LSB of tone bus to buzzer
        end
        else begin
            buzzer <= buzzer ^ 1;  // Toggle the buzzer state
        end

        // Increment the sound counter
        soundCounter <= soundCounter + 1;
    end
    else begin
        // If alarm is inactive, turn off the LilyPad Buzzer
        buzzer <= 0;

        // Reset the sound counter
        soundCounter <= 15'd0;
    end
end

endmodule
