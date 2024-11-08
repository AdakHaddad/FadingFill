module temp2pwm(
    input rdy,
    input [9:0] temp,    
    output reg [7:0] pwm
);

    parameter FAN_0_TEMP = 0;
    parameter FAN_100_TEMP = 6500;

    reg [7:0] desired_pwm;  
    reg [7:0] pwm_reg = 8'd0;  
    reg [15:0] div_counter = 0;  
    reg up = 1'b1;  
    
    always @(posedge rdy) begin
        div_counter <= div_counter + 1'b1;

        if (div_counter == 16'd10000) begin   
            div_counter <= 16'd0;
            
            if (temp <= FAN_0_TEMP) begin
                desired_pwm <= 8'd0;  
            end else if (temp >= FAN_100_TEMP) begin
                desired_pwm <= 8'd255;  
            end else begin
                desired_pwm <= (temp * 255) / FAN_100_TEMP;
            end
            
            if (up) begin
                if (pwm_reg < desired_pwm)
                    pwm_reg <= pwm_reg + 1'b1;  // Fade-in
                else
                    up <= 1'b0;  
            end else begin
                if (pwm_reg > 8'd0)
                    pwm_reg <= pwm_reg - 1'b1;  // Fade-out
                else
                    up <= 1'b1; 
            end
        end
        
        pwm <= pwm_reg;
    end

endmodule
