	component RedNeuronal_NiosII is
		port (
			clk_clk : in std_logic := 'X'  -- clk
		);
	end component RedNeuronal_NiosII;

	u0 : component RedNeuronal_NiosII
		port map (
			clk_clk => CONNECTED_TO_clk_clk  -- clk.clk
		);

