using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vigenere
{
    static class Encryption
    {
        public static string EncryptDecipher(string text, string key, string action)
        {
            int m = 0;
            int k = 0;
            int spaceCount = 0;
            bool upper = true;
            char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            char[] textToEncrypt = text.ToCharArray();
            char[] keyCharArray = key.ToUpper().ToCharArray();
            char[] encryptedTextArray = new char[textToEncrypt.Length];
            for (int i = 0; i < textToEncrypt.Length; i++)
            {
                if (textToEncrypt[i] == ' ')
                {
                    encryptedTextArray[i] = ' ';
                    spaceCount++;
                }
                else if (textToEncrypt[i] == '\r')
                {
                    encryptedTextArray[i] = '\r';
                    spaceCount++;
                }
                else if (textToEncrypt[i] == '\n')
                {
                    encryptedTextArray[i] = '\n';
                    spaceCount++;
                }
                else if (textToEncrypt[i] == '.')
                {
                    encryptedTextArray[i] = '.';
                    spaceCount++;
                }
                else
                {
                    if (char.IsUpper(textToEncrypt[i]))
                    {
                        upper = true;
                    }
                    else if (char.IsLower(textToEncrypt[i]))
                    {
                        upper = false;
                    }
                    int forKey = (i - spaceCount) % key.Length;
                    for (int j = 0; j < alphabet.Length; j++)
                    {
                        if (char.ToUpper(textToEncrypt[i]) == alphabet[j])
                        {
                            m = j;
                        }
                        if (keyCharArray[forKey] == alphabet[j])
                        {
                            k = j;
                        }
                    }
                    for (int n = 0; n < alphabet.Length; n++)
                    {
                        if (action == "encrypt")
                        {
                            if (n == ((m + k) % 26))
                            {
                                if (upper == true)
                                {
                                    encryptedTextArray[i] = Char.ToUpper(alphabet[n]);
                                }
                                else if (upper == false)
                                {
                                    encryptedTextArray[i] = Char.ToLower(alphabet[n]);
                                }
                            }
                        }
                        else if (action == "decipher")
                        {
                            if (n == (((m - k) + 26) % 26))
                            {
                                if (upper == true)
                                {
                                    encryptedTextArray[i] = Char.ToUpper(alphabet[n]);
                                }
                                else if (upper == false)
                                {
                                    encryptedTextArray[i] = Char.ToLower(alphabet[n]);
                                }
                            }
                        }
                    }
                }
            }
            string encryptedText = new string(encryptedTextArray);
            return encryptedText;
        }
    }
}
