module IRSensorModule (
    input wire irSensor,       // IR Beam Break Sensor input
    input wire systemArmed,    // System armed input
    output reg alarmActive     // Output to indicate if the alarm is active
);

always @(posedge irSensor or posedge systemArmed) begin
    if (systemArmed == 1'b1 && irSensor == 1'b1) begin
        // IR beam is broken and system is armed, activate the alarm
        alarmActive <= 1;
    end
    else begin
        // IR beam is not broken or system is not armed, deactivate the alarm
        alarmActive <= 0;
    end
end

endmodule
