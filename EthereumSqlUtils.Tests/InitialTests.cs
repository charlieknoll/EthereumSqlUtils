using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EthereumSqlUtils.Signer;
using Xunit;

namespace EthereumSqlUtils.Tests
{
    public class InitialTests
    {
        [Fact]
        public void CanGenerateEthAddressFromPrivateKey()
        {
            var privateKey = "f8f8a2f43c8376ccb0871305060d7b27b0554d2cc72bccf41b2705608452f315";
            var publicExpected = "0x001d3F1ef827552Ae1114027BD3ECF1f086bA0F9";
            var publicAddress = EthECKey.GetPublicAddress(privateKey);
            Assert.Equal(publicExpected,publicAddress);
        }
        [Fact]
        public void CanGenerateRandomEthKey()
        {
            var ethKey = EthECKey.GenerateKey();
            var publicAddress = ethKey.GetPublicAddress();
            var privateKey = ethKey.GetPrivateKey();
            var publicExpected = EthECKey.GetPublicAddress(privateKey);
            Assert.Equal(publicExpected,publicAddress);
        }
    }
}
