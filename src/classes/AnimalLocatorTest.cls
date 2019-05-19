@isTest
private class AnimalLocatorTest {
    @isTest static void testGetAnimalNameById() {
        Test.SetMock(HttpCallOutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
        string expectedResult='chicken';
        System.assertEquals(result, expectedResult);
    }
}