-- ============================
-- Create table: cb_lab_desafio
-- ============================

CREATE DATABASE IF NOT EXISTS cb_lab_desafio;
USE cb_lab_desafio;

-- ============================
-- Tabela: GuestCheck (Pedido)
-- ============================

CREATE TABLE GuestCheck (
    guestCheckId BIGINT PRIMARY KEY,
    chkNum INT,
    opnBusDt DATE,
    opnUTC TIMESTAMP,
    opnLcl TIMESTAMP,
    clsdBusDt DATE,
    clsdUTC TIMESTAMP,
    clsdLcl TIMESTAMP,
    lastTransUTC TIMESTAMP,
    lastTransLcl TIMESTAMP,
    lastUpdatedUTC TIMESTAMP,
    lastUpdatedLcl TIMESTAMP,
    clsdFlag BOOLEAN,
    gstCnt INT,
    subTtl DECIMAL(10,2),
    nonTxblSlsTtl DECIMAL(10,2),
    chkTtl DECIMAL(10,2),
    dscTtl DECIMAL(10,2),
    payTtl DECIMAL(10,2),
    balDueTtl DECIMAL(10,2),
    rvcNum INT,
    otNum INT,
    ocNum INT,
    tblNum INT,
    tblName VARCHAR(20),
    empNum INT,
    numSrvcRd INT,
    numChkPrntd INT,
    locRef VARCHAR(50),
    curUTC TIMESTAMP
);

-- ============================
-- Tabela: Tax (Impostos)
-- ============================

CREATE TABLE Tax (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guestCheckId BIGINT,
    taxNum INT,
    txblSlsTtl DECIMAL(10,2),
    taxCollTtl DECIMAL(10,2),
    taxRate DECIMAL(5,2),
    type INT,
    FOREIGN KEY (guestCheckId) REFERENCES GuestCheck(guestCheckId)
);

-- =======================================
-- Tabela: DetailLine (Itens do Pedido)
-- =======================================

CREATE TABLE DetailLine (
    guestCheckLineItemId BIGINT PRIMARY KEY,
    guestCheckId BIGINT,
    rvcNum INT,
    dtlOtNum INT,
    dtlOcNum INT,
    lineNum INT,
    dtlId INT,
    detailUTC TIMESTAMP,
    detailLcl TIMESTAMP,
    lastUpdateUTC TIMESTAMP,
    lastUpdateLcl TIMESTAMP,
    busDt DATE,
    wsNum INT,
    dspTtl DECIMAL(10,2),
    dspQty INT,
    aggTtl DECIMAL(10,2),
    aggQty INT,
    chkEmpId BIGINT,
    chkEmpNum INT,
    svcRndNum INT,
    seatNum INT,
    FOREIGN KEY (guestCheckId) REFERENCES GuestCheck(guestCheckId)
);

-- ====================================
-- Tabela: MenuItem (Item do Menu)
-- ====================================

CREATE TABLE MenuItem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guestCheckLineItemId BIGINT,
    miNum INT,
    modFlag BOOLEAN,
    inclTax DECIMAL(10,6),
    activeTaxes VARCHAR(20),
    prcLvl INT,
    FOREIGN KEY (guestCheckLineItemId) REFERENCES DetailLine(guestCheckLineItemId)
);

-- ====================================
-- Tabela: Discount (Descontos)
-- ====================================

CREATE TABLE Discount (
    id SERIAL PRIMARY KEY,
    guestCheckLineItemId BIGINT REFERENCES DetailLine(guestCheckLineItemId),
    discountNum INT,
    discountType VARCHAR(50),
    discountAmount DECIMAL(10,2),
    discountPercentage DECIMAL(5,2),
    applied BOOLEAN
);

-- ====================================
-- Tabela: ServiceCharge (Taxas de Serviço)
-- ====================================

CREATE TABLE ServiceCharge (
    id SERIAL PRIMARY KEY,
    guestCheckLineItemId BIGINT REFERENCES DetailLine(guestCheckLineItemId),
    serviceChargeNum INT,
    chargeType VARCHAR(50),
    amount DECIMAL(10,2),
    description VARCHAR(100)
);

-- ====================================
-- Tabela: TenderMedia (Pagamentos)
-- ====================================

CREATE TABLE TenderMedia (
    id SERIAL PRIMARY KEY,
    guestCheckLineItemId BIGINT REFERENCES DetailLine(guestCheckLineItemId),
    tenderType VARCHAR(50),
    amount DECIMAL(10,2),
    cardNumberMasked VARCHAR(20),
    transactionId VARCHAR(100),
    paymentTimestamp TIMESTAMP
);

-- ====================================
-- Tabela: ErrorCode (Erros)
-- ====================================

CREATE TABLE ErrorCode (
    id SERIAL PRIMARY KEY,
    guestCheckLineItemId BIGINT REFERENCES DetailLine(guestCheckLineItemId),
    code VARCHAR(20),
    message TEXT,
    severity VARCHAR(20),
    occurredAt TIMESTAMP
);