--
-- Synopsys
-- Vhdl wrapper for top level design, written on Tue Sep  7 12:44:37 2021
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_top is
   port (
      CAN_RX : in std_logic;
      DEVRST_N : in std_logic;
      MMUART_0_RXD : in std_logic;
      SPI_0_DI : in std_logic;
      XTL : in std_logic;
      BA : out std_logic_vector(1 downto 0);
      CAN_TX : out std_logic;
      CAN_TX_EN_N : out std_logic;
      CAS_N : out std_logic;
      CKE : out std_logic;
      CS_N : out std_logic_vector(2 downto 0);
      DQM : out std_logic_vector(1 downto 0);
      MMUART_0_TXD : out std_logic;
      RAS_N : out std_logic;
      SA : out std_logic_vector(13 downto 0);
      SDRCLK : out std_logic;
      SPI_0_DO : out std_logic;
      WE_N : out std_logic;
      DQ : in std_logic_vector(15 downto 0);
      GPIO_10_BI : in std_logic;
      GPIO_11_BI : in std_logic;
      GPIO_12_BI : in std_logic;
      GPIO_13_BI : in std_logic;
      GPIO_14_BI : in std_logic;
      GPIO_15_BI : in std_logic;
      GPIO_16_BI : in std_logic;
      GPIO_17_BI : in std_logic;
      GPIO_18_BI : in std_logic;
      GPIO_19_BI : in std_logic;
      GPIO_1_BI : in std_logic;
      GPIO_20_BI : in std_logic;
      GPIO_21_BI : in std_logic;
      GPIO_22_BI : in std_logic;
      GPIO_23_BI : in std_logic;
      GPIO_24_BI : in std_logic;
      GPIO_25_BI : in std_logic;
      GPIO_26_BI : in std_logic;
      GPIO_29_BI : in std_logic;
      GPIO_8_BI : in std_logic;
      GPIO_9_BI : in std_logic;
      I2C_0_SCL : in std_logic;
      I2C_0_SDA : in std_logic;
      SPI_0_CLK : in std_logic;
      SPI_0_SS0 : in std_logic
   );
end wrapper_for_top;

architecture rtl of wrapper_for_top is

component top
 port (
   CAN_RX : in std_logic;
   DEVRST_N : in std_logic;
   MMUART_0_RXD : in std_logic;
   SPI_0_DI : in std_logic;
   XTL : in std_logic;
   BA : out std_logic_vector (1 downto 0);
   CAN_TX : out std_logic;
   CAN_TX_EN_N : out std_logic;
   CAS_N : out std_logic;
   CKE : out std_logic;
   CS_N : out std_logic_vector (2 downto 0);
   DQM : out std_logic_vector (1 downto 0);
   MMUART_0_TXD : out std_logic;
   RAS_N : out std_logic;
   SA : out std_logic_vector (13 downto 0);
   SDRCLK : out std_logic;
   SPI_0_DO : out std_logic;
   WE_N : out std_logic;
   DQ : inout std_logic_vector (15 downto 0);
   GPIO_10_BI : inout std_logic;
   GPIO_11_BI : inout std_logic;
   GPIO_12_BI : inout std_logic;
   GPIO_13_BI : inout std_logic;
   GPIO_14_BI : inout std_logic;
   GPIO_15_BI : inout std_logic;
   GPIO_16_BI : inout std_logic;
   GPIO_17_BI : inout std_logic;
   GPIO_18_BI : inout std_logic;
   GPIO_19_BI : inout std_logic;
   GPIO_1_BI : inout std_logic;
   GPIO_20_BI : inout std_logic;
   GPIO_21_BI : inout std_logic;
   GPIO_22_BI : inout std_logic;
   GPIO_23_BI : inout std_logic;
   GPIO_24_BI : inout std_logic;
   GPIO_25_BI : inout std_logic;
   GPIO_26_BI : inout std_logic;
   GPIO_29_BI : inout std_logic;
   GPIO_8_BI : inout std_logic;
   GPIO_9_BI : inout std_logic;
   I2C_0_SCL : inout std_logic;
   I2C_0_SDA : inout std_logic;
   SPI_0_CLK : inout std_logic;
   SPI_0_SS0 : inout std_logic
 );
end component;

signal tmp_CAN_RX : std_logic;
signal tmp_DEVRST_N : std_logic;
signal tmp_MMUART_0_RXD : std_logic;
signal tmp_SPI_0_DI : std_logic;
signal tmp_XTL : std_logic;
signal tmp_BA : std_logic_vector (1 downto 0);
signal tmp_CAN_TX : std_logic;
signal tmp_CAN_TX_EN_N : std_logic;
signal tmp_CAS_N : std_logic;
signal tmp_CKE : std_logic;
signal tmp_CS_N : std_logic_vector (2 downto 0);
signal tmp_DQM : std_logic_vector (1 downto 0);
signal tmp_MMUART_0_TXD : std_logic;
signal tmp_RAS_N : std_logic;
signal tmp_SA : std_logic_vector (13 downto 0);
signal tmp_SDRCLK : std_logic;
signal tmp_SPI_0_DO : std_logic;
signal tmp_WE_N : std_logic;
signal tmp_DQ : std_logic_vector (15 downto 0);
signal tmp_GPIO_10_BI : std_logic;
signal tmp_GPIO_11_BI : std_logic;
signal tmp_GPIO_12_BI : std_logic;
signal tmp_GPIO_13_BI : std_logic;
signal tmp_GPIO_14_BI : std_logic;
signal tmp_GPIO_15_BI : std_logic;
signal tmp_GPIO_16_BI : std_logic;
signal tmp_GPIO_17_BI : std_logic;
signal tmp_GPIO_18_BI : std_logic;
signal tmp_GPIO_19_BI : std_logic;
signal tmp_GPIO_1_BI : std_logic;
signal tmp_GPIO_20_BI : std_logic;
signal tmp_GPIO_21_BI : std_logic;
signal tmp_GPIO_22_BI : std_logic;
signal tmp_GPIO_23_BI : std_logic;
signal tmp_GPIO_24_BI : std_logic;
signal tmp_GPIO_25_BI : std_logic;
signal tmp_GPIO_26_BI : std_logic;
signal tmp_GPIO_29_BI : std_logic;
signal tmp_GPIO_8_BI : std_logic;
signal tmp_GPIO_9_BI : std_logic;
signal tmp_I2C_0_SCL : std_logic;
signal tmp_I2C_0_SDA : std_logic;
signal tmp_SPI_0_CLK : std_logic;
signal tmp_SPI_0_SS0 : std_logic;

begin

tmp_CAN_RX <= CAN_RX;

tmp_DEVRST_N <= DEVRST_N;

tmp_MMUART_0_RXD <= MMUART_0_RXD;

tmp_SPI_0_DI <= SPI_0_DI;

tmp_XTL <= XTL;

BA <= tmp_BA;

CAN_TX <= tmp_CAN_TX;

CAN_TX_EN_N <= tmp_CAN_TX_EN_N;

CAS_N <= tmp_CAS_N;

CKE <= tmp_CKE;

CS_N <= tmp_CS_N;

DQM <= tmp_DQM;

MMUART_0_TXD <= tmp_MMUART_0_TXD;

RAS_N <= tmp_RAS_N;

SA <= tmp_SA;

SDRCLK <= tmp_SDRCLK;

SPI_0_DO <= tmp_SPI_0_DO;

WE_N <= tmp_WE_N;

tmp_DQ <= DQ;

tmp_GPIO_10_BI <= GPIO_10_BI;

tmp_GPIO_11_BI <= GPIO_11_BI;

tmp_GPIO_12_BI <= GPIO_12_BI;

tmp_GPIO_13_BI <= GPIO_13_BI;

tmp_GPIO_14_BI <= GPIO_14_BI;

tmp_GPIO_15_BI <= GPIO_15_BI;

tmp_GPIO_16_BI <= GPIO_16_BI;

tmp_GPIO_17_BI <= GPIO_17_BI;

tmp_GPIO_18_BI <= GPIO_18_BI;

tmp_GPIO_19_BI <= GPIO_19_BI;

tmp_GPIO_1_BI <= GPIO_1_BI;

tmp_GPIO_20_BI <= GPIO_20_BI;

tmp_GPIO_21_BI <= GPIO_21_BI;

tmp_GPIO_22_BI <= GPIO_22_BI;

tmp_GPIO_23_BI <= GPIO_23_BI;

tmp_GPIO_24_BI <= GPIO_24_BI;

tmp_GPIO_25_BI <= GPIO_25_BI;

tmp_GPIO_26_BI <= GPIO_26_BI;

tmp_GPIO_29_BI <= GPIO_29_BI;

tmp_GPIO_8_BI <= GPIO_8_BI;

tmp_GPIO_9_BI <= GPIO_9_BI;

tmp_I2C_0_SCL <= I2C_0_SCL;

tmp_I2C_0_SDA <= I2C_0_SDA;

tmp_SPI_0_CLK <= SPI_0_CLK;

tmp_SPI_0_SS0 <= SPI_0_SS0;



u1:   top port map (
		CAN_RX => tmp_CAN_RX,
		DEVRST_N => tmp_DEVRST_N,
		MMUART_0_RXD => tmp_MMUART_0_RXD,
		SPI_0_DI => tmp_SPI_0_DI,
		XTL => tmp_XTL,
		BA => tmp_BA,
		CAN_TX => tmp_CAN_TX,
		CAN_TX_EN_N => tmp_CAN_TX_EN_N,
		CAS_N => tmp_CAS_N,
		CKE => tmp_CKE,
		CS_N => tmp_CS_N,
		DQM => tmp_DQM,
		MMUART_0_TXD => tmp_MMUART_0_TXD,
		RAS_N => tmp_RAS_N,
		SA => tmp_SA,
		SDRCLK => tmp_SDRCLK,
		SPI_0_DO => tmp_SPI_0_DO,
		WE_N => tmp_WE_N,
		DQ => tmp_DQ,
		GPIO_10_BI => tmp_GPIO_10_BI,
		GPIO_11_BI => tmp_GPIO_11_BI,
		GPIO_12_BI => tmp_GPIO_12_BI,
		GPIO_13_BI => tmp_GPIO_13_BI,
		GPIO_14_BI => tmp_GPIO_14_BI,
		GPIO_15_BI => tmp_GPIO_15_BI,
		GPIO_16_BI => tmp_GPIO_16_BI,
		GPIO_17_BI => tmp_GPIO_17_BI,
		GPIO_18_BI => tmp_GPIO_18_BI,
		GPIO_19_BI => tmp_GPIO_19_BI,
		GPIO_1_BI => tmp_GPIO_1_BI,
		GPIO_20_BI => tmp_GPIO_20_BI,
		GPIO_21_BI => tmp_GPIO_21_BI,
		GPIO_22_BI => tmp_GPIO_22_BI,
		GPIO_23_BI => tmp_GPIO_23_BI,
		GPIO_24_BI => tmp_GPIO_24_BI,
		GPIO_25_BI => tmp_GPIO_25_BI,
		GPIO_26_BI => tmp_GPIO_26_BI,
		GPIO_29_BI => tmp_GPIO_29_BI,
		GPIO_8_BI => tmp_GPIO_8_BI,
		GPIO_9_BI => tmp_GPIO_9_BI,
		I2C_0_SCL => tmp_I2C_0_SCL,
		I2C_0_SDA => tmp_I2C_0_SDA,
		SPI_0_CLK => tmp_SPI_0_CLK,
		SPI_0_SS0 => tmp_SPI_0_SS0
       );
end rtl;
