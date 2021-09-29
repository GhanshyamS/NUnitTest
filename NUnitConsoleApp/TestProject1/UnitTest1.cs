using NUnit.Framework;
using NUnitConsoleApp;

namespace TestProject1
{
    public class Tests
    {
        Program program;
        [SetUp]
       
        public void Setup()
        {
            program = new Program();
        }

        [Test]
        public void Test1()
        {

            //Assert.Pass(program.IsTrue());
            Assert.IsTrue(program.IsTrue());
        }
    }
}