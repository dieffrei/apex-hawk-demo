@IsTest
private class SaleOpportunityTest {

    @IsTest
    static void applyDiscount_getTotalEventHandler_Success() {

        // given
        SaleOpportunity saleOpportunity = new SaleOpportunityBuilder()
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(13.59)
                .quantity(10))
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(15.01)
                .quantity(10))
            .build();

        final Decimal initialTotalValue = saleOpportunity.getTotalValue();
        final Decimal initialTotalValueMinus10Percent = initialTotalValue - ((initialTotalValue / 100) * 10);

        // when
        saleOpportunity.applyDiscount(10);

        // assert
        System.assertEquals(initialTotalValueMinus10Percent, saleOpportunity.totalValue_Test);

    }

    @IsTest
    static void applyDiscount_getTotal_Success() {

        // given
        SaleOpportunity saleOpportunity = new SaleOpportunityBuilder()
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(13.59)
                .quantity(10))
            .addItem(new SaleOpportunityLineItemBuilder()
                .unitPrice(15.01)
                .quantity(10))
            .build();

        final Decimal initialTotalValue = saleOpportunity.getTotalValue();
        final Decimal initialTotalValueMinus10Percent = initialTotalValue - ((initialTotalValue / 100) * 10);

        // when
        saleOpportunity.applyDiscount(10);

        // assert
        System.assertEquals(initialTotalValueMinus10Percent, saleOpportunity.getTotalValue());

    }
}
