package erds.com.util;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.CodeSigner;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.KeyStore.PrivateKeyEntry;
import java.security.KeyStore.ProtectionParameter;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.Security;
import java.security.Signature;
import java.security.SignatureException;
import java.security.SignedObject;
import java.security.Timestamp;
import java.security.UnrecoverableEntryException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertPath;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyAgreement;
import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.interfaces.DHPrivateKey;
import javax.crypto.interfaces.DHPublicKey;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.DHParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.util.encoders.Base64;

public class SecurityUtil {

	public static void main(String[] args) {
		
		/*for(Provider p:Security.getProviders()){
			System.out.println(p);
			for(Map.Entry<Object, Object> entry:p.entrySet()){
				System.out.println("\t"+entry.getKey());
			}
		}*/
		
		/*byte[] data = "Data Signature".getBytes();
		try {
			KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("DSA");
			keyPairGenerator.initialize(1024);
			KeyPair keyPair = keyPairGenerator.generateKeyPair();
			Signature signature = Signature.getInstance(keyPairGenerator.getAlgorithm());
			SignedObject s = new SignedObject(data, keyPair.getPrivate(), signature);
			byte[] sign = s.getSignature();
			boolean status = s.verify(keyPair.getPublic(), signature);
			System.out.println(status);
			System.out.println(sign.toString());
		} catch (NoSuchAlgorithmException | InvalidKeyException | SignatureException | IOException e) {
			e.printStackTrace();
		}*/
		
		
		/*try {
			CertificateFactory cf = CertificateFactory.getInstance("X509");
			CertPath cp = cf.generateCertPath(new FileInputStream("D:\\x.cer"));
			Timestamp t = new Timestamp(new Date(),cp);
			CodeSigner cs = new CodeSigner(cp, t);
			boolean status = cs.equals(new CodeSigner(cp, t));
			System.out.println(status);
		} catch (CertificateException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}*/
		
		/*try {
			FileInputStream is = new FileInputStream("D:\\.keystore");
			KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
			ks.load(is, "password".toCharArray());
			is.close();
			PrivateKey key = (PrivateKey) ks.getKey("alias", "password".toCharArray());
			ProtectionParameter protParam = new KeyStore.PasswordProtection("password".toCharArray());
			KeyStore.PrivateKeyEntry pkEntry = (PrivateKeyEntry) ks.getEntry("alias", protParam);
			PrivateKey privateKey = pkEntry.getPrivateKey();
		} catch (KeyStoreException | NoSuchAlgorithmException | CertificateException | IOException | UnrecoverableEntryException e) {
			e.printStackTrace();
		}*/
		
		/*byte[] input = "MAC".getBytes();
		try {
			KeyGenerator keyGenerator = KeyGenerator.getInstance("HmacMD5");
			SecretKey secretKey = keyGenerator.generateKey();
			Mac mac = Mac.getInstance(secretKey.getAlgorithm());
			mac.init(secretKey);
			byte[] output = mac.doFinal(input);
			System.out.println(new String(output));
		} catch (NoSuchAlgorithmException | InvalidKeyException e) {
			e.printStackTrace();
		}*/
		
		/*try {
			KeyPairGenerator kpg = KeyPairGenerator.getInstance("DH");
			KeyPair kp1 = kpg.genKeyPair();
			KeyPair kp2 = kpg.genKeyPair();
			KeyAgreement keyAgreement = KeyAgreement.getInstance(kpg.getAlgorithm());
			keyAgreement.init(kp2.getPrivate());
			keyAgreement.doPhase(kp1.getPublic(), true);
			SecretKey secretKey = keyAgreement.generateSecret("DES");
		} catch (NoSuchAlgorithmException | InvalidKeyException e) {
			e.printStackTrace();
		}*/
		
		/*try {
			KeyGenerator generator = KeyGenerator.getInstance("DES");
			SecretKey secretKey = generator.generateKey();
			byte[] key = secretKey.getEncoded();
			DESKeySpec dks = new DESKeySpec(key);
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey secretKey2 = keyFactory.generateSecret(dks);
		} catch (NoSuchAlgorithmException | InvalidKeyException | InvalidKeySpecException e) {
			e.printStackTrace();
		}*/
		
		/*try {
			KeyGenerator generator = KeyGenerator.getInstance("DES");
			SecretKey secretKey = generator.generateKey();
			Cipher cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.WRAP_MODE, secretKey);
			byte[] k = cipher.wrap(secretKey);
			//解包
			cipher.init(Cipher.UNWRAP_MODE, secretKey);
			Key key = cipher.unwrap(k, "DES", Cipher.SECRET_KEY);
			//加密
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			byte[] input = cipher.doFinal("DES DATA".getBytes());
			//解密
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			byte[] output = cipher.doFinal(input);
		} catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException e) {
			e.printStackTrace();
		}*/

		/*try {
			KeyGenerator generator = KeyGenerator.getInstance("DES");
			SecretKey secretKey = generator.generateKey();
			Cipher cipher = Cipher.getInstance("DES");
			//解密
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			CipherInputStream cis = new CipherInputStream(new FileInputStream(new File("secret")),cipher);
			DataInputStream dis = new DataInputStream(cis);
			String output = dis.readUTF();
			dis.close();
			System.out.println(output);
			//加密
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			String input = "1234567890";
			CipherOutputStream cos = new CipherOutputStream(new FileOutputStream(new File("secret")), cipher);
			DataOutputStream dos = new DataOutputStream(cos);
			dos.writeUTF(input);
			dos.flush();
			dos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		/*Base64 b = new Base64();
		byte[] s = b.encode("你好".getBytes());
		System.out.println(new String(s));
		byte[] a = b.decode(s);
		System.out.println(new String(a));*/

		/*try {
			//生成甲方密钥对
			Map<String,Object> keyMap = initKey();
			byte[] privateKey = getPrivateKey(keyMap);
			byte[] publicKey = getPublicKey(keyMap);
			System.out.println("甲方公钥:"+new String(Base64.encode(publicKey)));
			System.out.println("甲方私钥:"+new String(Base64.encode(privateKey)));
			//由甲方公钥产生本地密钥对
			Map<String,Object> keyMap2 = initKey(publicKey);
			byte[] privateKey2 = getPrivateKey(keyMap2);
			byte[] publicKey2 = getPublicKey(keyMap2);
			System.out.println("乙方公钥:"+new String(Base64.encode(publicKey2)));
			System.out.println("乙方私钥:"+new String(Base64.encode(privateKey2)));
			byte[] key1 = getSecretKey(publicKey2, privateKey);
			System.out.println("甲方本地密钥:"+new String(Base64.encode(key1)));
			byte[] key2 = getSecretKey(publicKey, privateKey2);
			System.out.println("乙方本地密钥:"+new String(Base64.encode(key2)));
			
			String input1="密码交换算法";
			System.out.println("原文:"+input1);
			byte[] code1 = encrypt(input1.getBytes(), key1);
			System.out.println("加密:"+new String(code1));
			byte[] decode1 = decrypt(code1, key2);
			String output1 = new String(decode1);
			System.out.println("解密:"+output1);
			
			String input2 = "DH";
			System.out.println("原文:"+input2);
			byte[] code2 = encrypt(input2.getBytes(), key2);
			System.out.println("加密:"+new String(code2));
			byte[] decode2 = decrypt(code2, key1);
			String output2 = new String(decode2);
			System.out.println("解密:"+output2);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		try {
			//获取私钥
			KeyStore ks = getKeyStore("D:\\JavaDemo\\Certificate\\zlex.keystore", "123456");
			PrivateKey privateKey = (PrivateKey) ks.getKey("www.zlex.org", "123456".toCharArray());
			//获取证书
			X509Certificate x509Certificate = (X509Certificate) ks.getCertificate("www.zlex.org");
			Signature signature = Signature.getInstance(x509Certificate.getSigAlgName());
			signature.initSign(privateKey);
			//获取公钥
			Certificate certificate = getCertificate("D:\\JavaDemo\\Certificate\\zlex.cer");
			PublicKey publicKey = certificate.getPublicKey();
			//初始化签名对象
			//获取证书
			X509Certificate x509Certificate1 = (X509Certificate) getCertificate("D:\\JavaDemo\\Certificate\\zlex.cer");
			Signature signature1 = Signature.getInstance(x509Certificate1.getSigAlgName());
			signature1.initVerify(x509Certificate1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 初始化甲方密钥
	 * @return Map 甲方密钥Map
	 * @throws Exception
	 */
	public static Map<String,Object> initKey() throws Exception{
		KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("DH");
		keyPairGenerator.initialize(512);
		KeyPair keyPair = keyPairGenerator.generateKeyPair();
		DHPublicKey publicKey = (DHPublicKey) keyPair.getPublic();
		DHPrivateKey privateKey = (DHPrivateKey) keyPair.getPrivate();
		Map<String,Object> keyMap = new HashMap<String,Object>(2);
		keyMap.put("DHPublicKey", publicKey);
		keyMap.put("DHPrivateKey", privateKey);
		return keyMap;
	}
	/**
	 * 初始化乙方密钥
	 * @param key 甲方公钥
	 * @return Map 乙方密钥Map
	 * @throws Exception
	 */
	public static Map<String,Object> initKey(byte[] key)throws Exception{
		X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(key);
		KeyFactory factory = KeyFactory.getInstance("DH");
		PublicKey publicKey = factory.generatePublic(x509EncodedKeySpec);
		DHParameterSpec dhParameterSpec = ((DHPublicKey)publicKey).getParams();
		KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(factory.getAlgorithm());
		keyPairGenerator.initialize(dhParameterSpec);
		KeyPair keyPair = keyPairGenerator.genKeyPair();
		DHPublicKey publicKey2 = (DHPublicKey) keyPair.getPublic();
		DHPrivateKey privateKey = (DHPrivateKey) keyPair.getPrivate();
		Map<String,Object> keyMap = new HashMap<String,Object>(2);
		keyMap.put("DHPublicKey", publicKey2);
		keyMap.put("DHPrivateKey", privateKey);
		return keyMap;
	}
	/**
	 * 加密
	 * @param data 待加密的数据
	 * @param key 密钥
	 * @return byte[] 加密数据
	 * @throws Exception
	 */
	public static byte[] encrypt(byte[] data,byte[] key)throws Exception {
		SecretKey secretKey = new SecretKeySpec(key, "AES");
		Cipher cipher = Cipher.getInstance(secretKey.getAlgorithm());
		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
		return cipher.doFinal(data);
	}
	/**
	 * 解密
	 * @param data 待解密数据
	 * @param key 密钥
	 * @return byte[] 解密数据
	 * @throws Exception
	 */
	public static byte[] decrypt(byte[] data,byte[] key)throws Exception{
		SecretKey secretKey = new SecretKeySpec(key, "AES");
		Cipher cipher = Cipher.getInstance(secretKey.getAlgorithm());
		cipher.init(Cipher.DECRYPT_MODE, secretKey);
		return cipher.doFinal(data);
	}
	/**
	 * 构建密钥
	 * @param publicKey 公钥
	 * @param privateKey 私钥
	 * @return 本地密钥
	 * @throws Exception
	 */
	public static byte[] getSecretKey(byte[] publicKey,byte[] privateKey)throws Exception{
		KeyFactory keyFactory = KeyFactory.getInstance("DH");
		X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(publicKey);
		PublicKey publicKey2 = keyFactory.generatePublic(x509EncodedKeySpec);
		PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(privateKey);
		PrivateKey privateKey2 = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
		KeyAgreement keyAgreement = KeyAgreement.getInstance(keyFactory.getAlgorithm());
		keyAgreement.init(privateKey2);
		keyAgreement.doPhase(publicKey2, true);
		SecretKey secretKey = keyAgreement.generateSecret("AES");
		return secretKey.getEncoded();
	}
	/**
	 * 取得私钥
	 * @param keyMap 密钥map
	 * @return 私钥
	 * @throws Exception
	 */
	public static byte[] getPrivateKey(Map<String,Object> keyMap) throws Exception{
		Key key = (Key) keyMap.get("DHPrivateKey");
		return key.getEncoded();
	}
	/**
	 * 取得公钥
	 * @param keyMap 密钥map
	 * @return 公钥
	 * @throws Exception
	 */
	public static byte[] getPublicKey(Map<String,Object> keyMap) throws Exception{
		Key key = (Key) keyMap.get("DHPublicKey");
		return key.getEncoded();
	}
	/**
	 * 获得KeyStore
	 * @param keyStorePath 密钥库路径
	 * @param password 密码
	 * @return keyStore 密钥库
	 * @throws Exception
	 */
	public static KeyStore getKeyStore(String keyStorePath,String password) throws Exception{
		KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
		FileInputStream is = new FileInputStream(keyStorePath);
		ks.load(is, password.toCharArray());
		is.close();
		return ks;
	}
	/**
	 * 获得Certificate
	 * @param certificatePath 证书路径
	 * @return 证书
	 * @throws Exception
	 */
	private static Certificate getCertificate(String certificatePath) throws Exception{
		CertificateFactory factory = CertificateFactory.getInstance("X.509");
		FileInputStream in = new FileInputStream(certificatePath);
		Certificate certificate = factory.generateCertificate(in);
		in.close();
		return certificate;
	}
	
}
