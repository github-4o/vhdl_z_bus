library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity node is
    generic (
        gFirst: boolean
    );
    port (
        ioBus: inout std_logic_vector
    );
end entity;

architecture v1 of node is

    constant step: time := 5 ns;
    constant cz: std_logic_vector (ioBus'range) := (others => 'Z');

    signal iBus: std_logic_vector (ioBus'range);
    signal oBus: std_logic_vector (ioBus'range);

begin

    iBus <= ioBus;
    ioBus <= oBus;

    process
        variable val: unsigned (iBus'range);
        variable first: boolean := gFirst;
    begin
        oBus <= cz;
        if first then
            oBus <= (iBus'range => '0');
            wait for step;
            oBus <= cz;
            wait for step / 2;
            first := false;
        end if;

        wait until iBus /= cz;
        val := unsigned (iBus);
        wait until iBus = cz;

        report  "first " & boolean'image(gFirst) & " assigning";
        wait for step;
        oBus <= std_logic_vector (val + 1);
        wait for step;
        oBus <= cz;
        wait for step / 2;
    end process;
        
end v1;
