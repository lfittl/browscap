require 'browscap'

describe Browscap do
  before(:each) do
    @browscap = Browscap.new
  end
  
  it "should detect Konqueror 3.5 on Linux" do
    konq35 = @browscap.query "Mozilla/5.0 (compatible; Konqueror/3.5; Linux; X11; de) KHTML/3.5.2 (like Gecko) Kubuntu 6.06 Dapper"
    konq35.browser.should == 'Konqueror'
    konq35.version.should == '3.5'
    konq35.platform.should == 'Linux'
  end
  
  it "should detect Firefox 1.5 on Linux" do
    ff15 = @browscap.query "Mozilla/5.0 (X11; U; Linux i686; de; rv:1.8.0.5) Gecko/20060731 Ubuntu/dapper-security Firefox/1.5.0.5"
    ff15.browser.should == 'Firefox'
    ff15.version.should == '1.5'
    ff15.platform.should == 'Linux'
  end
  
  it "should detect Mozilla 1.7 on Linux" do
    moz17 = @browscap.query "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20060216 Debian/1.7.12-1.1ubuntu2"
    moz17.browser.should == 'Mozilla'
    moz17.version.should == '1.7'
    moz17.platform.should == 'Linux'
  end
  
  it "should detect Firefox 1.5 on Linux (2)" do
    ff15 = @browscap.query "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.5) Gecko/20060731 Ubuntu/dapper-security Epiphany/2.14 Firefox/1.5.0.5"
    ff15.browser.should == 'Firefox'
    ff15.version.should == '1.5'
    ff15.platform.should == 'Linux'
  end
  
  it "should detect Opera 9.0 on Linux" do
    opera90 = @browscap.query "Opera/9.00 (X11; Linux i686; U; en)"
    opera90.browser.should == 'Opera'
    opera90.version.should == '9.0'
    opera90.platform.should == 'Linux'
  end
  
  it "shouldn't detect Kazehakase" do
    @browscap.query("Mozilla/5.0 (X11; Linux i686; U;) Gecko/20051128 Kazehakase/0.3.3 Debian/0.3.3-1").should be_nil
  end
  
  it "should detect Galeon 1.3 on Linux" do
    galeon13 = @browscap.query "Mozilla/5.0 (X11; U; Linux i386) Gecko/20063102 Galeon/1.3test"
    galeon13.browser.should == 'Galeon'
    galeon13.version.should == '1.3'
    galeon13.platform.should == 'Linux'
  end
  
  it "should detect MSIE 6.0 on Windows 98" do
    ie6 = @browscap.query "Mozilla/4.0 (compatible; MSIE 6.0; Windows 98)"
    ie6.browser.should == 'IE'
    ie6.version.should == '6.0'
    ie6.platform.should == 'Win98'
  end

  it "should detect Wget as crawler" do
    wget = @browscap.query "Wget/1.10.2"
    wget.crawler.should == true
  end
  
  it "should detect Googlebot as crawler" do
    google = @browscap.query "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    google.crawler.should == true
  end
  
  it "should detect Yahoo! bot as crawler" do
    yahoo = @browscap.query "Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)"
    yahoo.crawler.should == true
  end
end
