import org.performancehints.ThreadHints;

public class TestOnSpinWait {

    public static void main(String[] args) throws Exception {

      Launcher.main(args);

    }

    static class Launcher {

        public static void main(final String[] args) throws Exception {
            int end = 100000;

            for (int i=0; i < end; i++) {
                test();
            }
        }
        static void test() {
            ThreadHints.onSpinWait();
        }
    }
}
