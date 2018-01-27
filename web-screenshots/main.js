const puppeteer = require('puppeteer');
var lineReader = require('readline').createInterface({
    input: require('fs').createReadStream('input_domains.txt')
});


(async() => {



    // const browser = await puppeteer.launch();
    // var page = await browser.newPage();

    var domains = [];


    lineReader.on('line', function (line) {
        console.log('loaded domain:', line);
        domains.push(line);
    });

    console.log("Loaded " + domains.length + " domains");

    const browser = await puppeteer.launch({
        ignoreHTTPSErrors: true
    });
    var page = await browser.newPage();
    page.setViewport({
        width: 1920,
        height: 1080
    })

    for (var i in domains) {
        var domain = domains[i];
        var url = "http://" + domain;
        console.log("opening page... " + domain);
        // await page.goto(url);

        try {
            await page.goto(url);
        } catch (error) {
            console.log(error);
        }


        console.log("making screenshot...");
        await page.screenshot({
            path: "screenshots\\" + domain + '.png'
        });

        console.log("Progress... " + (((Number(i) + 1) / domains.length) * 100).toFixed(2) + "%");
    }

    console.log("closing browser...");

    await browser.close();
    //   lineReader.close();

})();