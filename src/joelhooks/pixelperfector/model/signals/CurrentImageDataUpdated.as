package joelhooks.pixelperfector.model.signals
{
    import flash.display.BitmapData;

    import org.osflash.signals.Signal;

    public class CurrentImageDataUpdated extends Signal
    {
        public function CurrentImageDataUpdated()
        {
            super(BitmapData);
        }
    }
}