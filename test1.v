module test1
(
   input SCK,
	input RST,
	output reg [3:0] PIN
   
);

reg [24:0] COUNT;

always@(posedge SCK or negedge RST)
	begin
		if(RST ==1'b0)
			COUNT <=25'd0;
		else if ( COUNT == 25'd24_999_999)
				COUNT <=25'd0;
		else 
			COUNT <= COUNT +32'd1;
	end

 always@(posedge SCK or negedge RST)
   begin
		if(RST ==1'b0)
			PIN <=4'b0000;
	   else if(COUNT == 25'd6_999_999)
		   PIN <=4'b0001;
		else if(COUNT == 25'd12_999_999)
		   PIN <=4'b0010;
		else if(COUNT == 25'd18_999_999)
		   PIN <=4'b0100;
		else if(COUNT == 25'd24_999_999)
		   PIN <=4'b1000;
	
   end 

endmodule 

