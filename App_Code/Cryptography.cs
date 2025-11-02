using System;
using System.Security.Cryptography;
using System.Text;

public static class Cryptography
{
    public static string HashSha256(string input)
    {
        using (var sha = SHA256.Create())
        {
            var bytes = Encoding.UTF8.GetBytes(input);
var hash = sha.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }
    }

    public static bool VerifySha256(string input, string base64Hash)
    {
        var computed = HashSha256(input);
return string.Equals(computed, base64Hash);
    }  
}