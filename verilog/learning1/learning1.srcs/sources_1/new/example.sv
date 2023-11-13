
// The following contains SystemVerilog constructs and should not be used if using a tool that does not support this standard

   enum logic [15:0] {<state1>  = 16'b0000000000000001,
                      <state2>  = 16'b0000000000000010,
                      <state3>  = 16'b0000000000000100,
                      <state4>  = 16'b0000000000001000,
                      <state5>  = 16'b0000000000010000,
                      <state6>  = 16'b0000000000100000,
                      <state7>  = 16'b0000000001000000,
                      <state8>  = 16'b0000000010000000,
                      <state9>  = 16'b0000000100000000,
                      <state10> = 16'b0000001000000000,
                      <state11> = 16'b0000010000000000,
                      <state12> = 16'b0000100000000000,
                      <state13> = 16'b0001000000000000,
                      <state14> = 16'b0010000000000000,
                      <state15> = 16'b0100000000000000,
                      <state16> = 16'b1000000000000000} <state>;

   always @(posedge <clock>)
      if (<reset>)
         <state> <= <state1>;
      else
         case (state)
            <state1> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state2> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state3> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state4> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state5> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state6> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state7> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state8> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state9> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state10> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state11> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state12> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state13> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state14> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state15> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
            <state16> : begin
               if (<condition>)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
            end
         endcase

   assign <output1> = <logic_equation_based_on_states_and_inputs>;
   assign <output2> = <logic_equation_based_on_states_and_inputs>;
   // Add other output equations as necessary
							
						