library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb is
end entity;

architecture v1 of tb is

    component node
        generic (
            gFirst: boolean
        );
        port (
            ioBus: inout std_logic_vector
        );
    end component;

    signal sBus: std_logic_vector (7 downto 0);

begin

    first: node
        generic map (
            gFirst => true
        )
        port map (
            ioBus => sBus
        );

   second: node
        generic map (
            gFirst => false
        )
        port map (
            ioBus => sBus
        );

    process
    begin
        wait for 5 ns;
        report "tick";
    end process;

end v1;
