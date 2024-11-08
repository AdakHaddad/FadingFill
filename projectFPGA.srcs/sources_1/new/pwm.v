module pwm(
    input clk,             
    input [7:0] fill,      
    input rst,             
    output reg state       
);

    reg [7:0] counter;     
    reg [7:0] duty;        
    reg [15:0] div;        

    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            counter <= 8'd0;     
            duty <= fill;        
            div <= 16'd0;        
            state <= (counter < duty) ? 1'b1 : 1'b0;
        end else begin
            counter <= counter + 1'b1; 
            
            div <= div + 1'b1;
            if (div == 16'd10000) begin  
                div <= 16'd0;           
                
                if (duty < 8'd255)
                    duty <= duty + 1'b1;  
                else if (duty > 8'd0)
                    duty <= duty - 1'b1; 
            end
            
            state <= (counter < duty) ? 1'b1 : 1'b0;
        end
    end

endmodule
