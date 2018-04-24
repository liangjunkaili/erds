package erds.test;

import org.springframework.asm.ClassWriter;
import org.springframework.asm.MethodVisitor;
import org.springframework.asm.Opcodes;

public class ASMHelloWorld extends ClassLoader implements Opcodes{

	public static void main(final String args[]) throws Exception{
		ClassWriter cw = new ClassWriter(ClassWriter.COMPUTE_MAXS | ClassWriter.COMPUTE_FRAMES);
		cw.visit(V1_7, ACC_PUBLIC, "Example", null, "java/lang/Object", null);
		MethodVisitor mw = cw.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
		mw.visitVarInsn(ALOAD, 0);
		mw.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V");
		mw.visitInsn(RETURN);
		mw.visitMaxs(0, 0);
		mw.visitEnd();
		mw = cw.visitMethod(ACC_PUBLIC+ACC_STATIC, "main", "([Ljava/lang/String;)V", null, null);
		mw.visitFieldInsn(GETSTATIC, "java/lang/System", "out", "Ljava/io/PrintStream;");
		mw.visitLdcInsn("Hello World!");
		mw.visitMethodInsn(INVOKEVIRTUAL, "java/io/PrintStream", "println", "(Ljava/lang/String;)V");
		mw.visitInsn(RETURN);
		mw.visitMaxs(0, 0);
		mw.visitEnd();
		byte[] code = cw.toByteArray();
		
		ASMHelloWorld loader = new ASMHelloWorld();
		Class exampleClass = loader.defineClass("Example", code, 0, code.length);
		exampleClass.getMethods()[0].invoke(null, new Object[]{null});
	}
}
