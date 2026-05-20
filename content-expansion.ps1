param()

$site = 'C:\Users\advik.DESKTOP-GNPI7JP\OneDrive\Desktop\Elec and Plum Web\Sydney elctrical and maintaince website'

function Insert-BlockBeforeMainEnd {
    param(
        [string]$Path,
        [string]$Block,
        [string]$Marker = 'AUTO_CONTENT_BLOCK'
    )

    $content = Get-Content -Path $Path -Raw
    if ($content -like "*$Marker*") {
        return
    }

    $content = $content -replace '</main>', "$Block`r`n  </main>"
    Set-Content -Path $Path -Value $content
}

function Get-HeadingText {
    param([string]$Path)
    $raw = Get-Content -Path $Path -Raw
    if ($raw -match '<h1>(.*?)</h1>') {
        return $matches[1]
    }
    return [System.IO.Path]::GetFileNameWithoutExtension($Path)
}

$homepage = Join-Path $site 'index.html'
Insert-BlockBeforeMainEnd -Path $homepage -Marker 'homepage-expansion' -Block @'
    <section class="section homepage-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">Why people call us first</h2>
          <p class="section-lead">Electrical problems usually start as small annoyances, then become outages, unsafe circuits, or repeated call-outs. We try to stop the problem early and explain the real cause before it becomes expensive.</p>
          <p>That means we look beyond the single symptom. We check the switchboard, the load on the circuit, the age of the wiring, and whether the property has grown past the capacity of the original installation. This matters in older Sydney homes and in commercial sites where systems have been patched over time.</p>
          <p>Our goal is not to make the job sound dramatic. It is to give you the right amount of detail so you know what is wrong, what is urgent, what can wait, and what a proper repair should include. That is the difference between a fast fix and a reliable result.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Built for urgent and planned work</h3>
          <p>We handle emergency call-outs, safety checks, upgrade planning, lighting changes, and ongoing maintenance across Sydney NSW.</p>
          <a class="btn btn-primary" href="services.html">See services</a>
        </div>
      </div>
    </section>

    <section class="section homepage-expansion">
      <div class="container grid">
        <article class="card reveal">
          <h3>Home electrical work</h3>
          <p>Lighting, sockets, fans, switchboards, repairs, and upgrades for houses, units, and renovations.</p>
          <p>We focus on making the result safe and practical. If a simple repair is enough, we will say so. If the issue is bigger, we explain why before anything starts.</p>
        </article>
        <article class="card reveal">
          <h3>Commercial support</h3>
          <p>Offices, retail spaces, and light industrial sites need fast response and clear communication.</p>
          <p>We work around trading hours where possible and keep your team informed about timing, access, shut-downs, and the order of work.</p>
        </article>
        <article class="card reveal">
          <h3>Emergency response</h3>
          <p>Power loss, blown breakers, unsafe switchboards, and urgent failures need direct action.</p>
          <p>Our 24/7 service is built around getting the site safe, restoring power where possible, and making sure the fault does not come back the next day.</p>
        </article>
      </div>
    </section>

    <section class="section homepage-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">What good electrical work should include</h2>
          <ul class="list">
            <li>A proper diagnosis instead of a quick patch.</li>
            <li>Clear explanation of the fault and the recommended fix.</li>
            <li>Testing after the work so the result is verified.</li>
            <li>Advice on related risks that should be watched.</li>
            <li>Work that leaves the area clean and the system clearly labeled.</li>
          </ul>
        </div>
        <div class="reveal">
          <h2 class="section-title">How we help Sydney customers</h2>
          <p class="section-lead">A good service page should answer the question behind the search, not just the keyword. That is what this site is moving toward: useful pages that explain the work, the warning signs, the process, and the next step.</p>
          <p>For Sydney customers, that usually means a fast response to the immediate issue, followed by a fix that makes the property safer, more reliable, and easier to maintain over time.</p>
        </div>
      </div>
    </section>
'@

$about = Join-Path $site 'about.html'
Insert-BlockBeforeMainEnd -Path $about -Marker 'about-expansion' -Block @'
    <section class="section about-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">Why the business exists</h2>
          <p class="section-lead">Sydney Electrical and Maintenance is built around a simple idea: people want a licensed electrician who explains the job properly, turns up when promised, and leaves the site safer than it was before.</p>
          <p>That sounds basic, but it is exactly what gets lost when work becomes rushed or when too many people touch the same job. We try to keep the service direct and consistent so homeowners, landlords, and business managers know what they are getting from the first call to the final handover.</p>
          <p>We also think good electrical work should make the next decision easier. If the property only needs a repair, we will tell you. If a bigger upgrade is the better call, we will explain why in plain language so you can make the right choice without pressure.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Our standard</h3>
          <p>Clear communication, clean workmanship, and a result that still makes sense long after the electrician has left.</p>
          <a class="btn btn-primary" href="contact.html">Talk to us</a>
        </div>
      </div>
    </section>

    <section class="section about-expansion">
      <div class="container grid">
        <article class="card reveal">
          <h3>How we quote</h3>
          <p>We scope the issue, explain what is needed, and give you a quote that matches the actual job rather than the most optimistic guess.</p>
        </article>
        <article class="card reveal">
          <h3>How we work onsite</h3>
          <p>We confirm the safety concern first, then complete the job in a way that is practical, compliant, and easy to maintain later.</p>
        </article>
        <article class="card reveal">
          <h3>How we think about follow-up</h3>
          <p>If there is a larger upgrade needed, we do not hide it. We explain what can wait and what should not be left alone.</p>
        </article>
      </div>
    </section>
'@

$servicesHub = Join-Path $site 'services.html'
Insert-BlockBeforeMainEnd -Path $servicesHub -Marker 'services-expansion' -Block @'
    <section class="section services-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">How our service pages are organised</h2>
          <p class="section-lead">Each service page is meant to answer the real questions people search before they call: what the job involves, what warning signs matter, what changes the price, and when to choose a repair versus an upgrade.</p>
          <p>This structure matters for SEO and for usability. Instead of one thin page pretending to cover everything, each service gets its own page with the right examples, the right terminology, and enough detail to help the customer decide quickly.</p>
          <p>That also means the pages should not all read the same. Some jobs are urgent and safety-focused, some are installation-driven, and some are better explained as part of a wider renovation or maintenance plan. The copy needs to reflect that difference.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Need the right page fast?</h3>
          <p>If you are unsure which service fits the problem, call us and we will point you to the right page or book the right electrician directly.</p>
          <a class="btn btn-primary" href="tel:0412396505">Call 0412 396 505</a>
        </div>
      </div>
    </section>

    <section class="section services-expansion">
      <div class="container grid">
        <article class="card reveal">
          <h3>Repairs</h3>
          <p>Repair pages should explain symptoms, likely causes, safety risks, and the process of finding the fault.</p>
        </article>
        <article class="card reveal">
          <h3>Installations</h3>
          <p>Installation pages should cover setup, compatibility, circuit capacity, and what the handover looks like.</p>
        </article>
        <article class="card reveal">
          <h3>Upgrades</h3>
          <p>Upgrade pages should explain the reasons people move from old systems to newer, safer, and more efficient ones.</p>
        </article>
      </div>
    </section>
'@

$serviceAreasHub = Join-Path $site 'service-areas.html'

$blogHub = Join-Path $site 'blog.html'
Insert-BlockBeforeMainEnd -Path $blogHub -Marker 'blog-hub-expansion' -Block @'
    <section class="section blog-hub-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">What this blog is for</h2>
          <p class="section-lead">These posts should read like real advice, not filler. Each article should help a reader understand a problem, compare options, and decide when to call a licensed electrician.</p>
          <p>That means the posts need context, examples, warning signs, steps, and practical takeaways. They should also link into the relevant service pages so the information has somewhere useful to go.</p>
          <p>The stronger the article, the more it can do at once: educate the customer, support SEO, and quietly lead the reader toward the right service page when they are ready to act.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>More topics coming</h3>
          <p>Switchboards, safety switches, lighting upgrades, EV chargers, emergency faults, and home electrical planning.</p>
          <a class="btn btn-primary" href="contact.html">Suggest a topic</a>
        </div>
      </div>
    </section>
'@

$reviews = Join-Path $site 'reviews.html'
Insert-BlockBeforeMainEnd -Path $reviews -Marker 'reviews-expansion' -Block @'
    <section class="section reviews-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">What the reviews should tell you</h2>
          <p class="section-lead">Reviews should give you confidence about the parts that matter most: communication, punctuality, safety, workmanship, and whether the electrician actually solved the issue.</p>
          <p>That is why this page exists separately from the homepage. It gives people a place to check the social proof without burying it under the main conversion flow.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Need to compare first?</h3>
          <p>Open our profile, read the latest reviews, then call if you want a quote or emergency help.</p>
          <a class="btn btn-primary" href="https://share.google/2CSlGpySI0W5f610p" target="_blank" rel="noopener">Open profile</a>
        </div>
      </div>
    </section>
'@

$blogFiles = Get-ChildItem -Path (Join-Path $site 'blog') -Filter *.html -File
foreach ($file in $blogFiles) {
    $raw = Get-Content -Path $file.FullName -Raw
    if ($raw -like '*blog-post-expansion*') {
        continue
    }

    $heading = Get-HeadingText -Path $file.FullName
    $block = @"
    <section class="section blog-post-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">Blog deep dive</h2>
          <p class="section-lead">This article goes beyond a quick overview and explains the background, the warning signs, the likely causes, and what a proper electrician should check onsite.</p>
          <p>It is written to help a reader make a real decision, not just skim a headline. That means more context, more practical examples, and a clearer next step when the issue is urgent or complicated.</p>
          <p>For SEO, this also gives the page enough substance to stand on its own instead of acting like a thin teaser that points somewhere else.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Related service</h3>
          <p>Use this article to decide whether you need an inspection, repair, upgrade, or emergency attendance.</p>
          <a class="btn btn-primary" href="../services.html">View services</a>
        </div>
      </div>
    </section>

    <section class="section blog-post-expansion">
      <div class="container grid">
        <article class="card reveal">
          <h3>What to look for</h3>
          <p>We expand the common symptoms, the risks, and the signs that the problem is already past the DIY stage.</p>
          <p>This is where the reader should understand whether the issue is cosmetic, inconvenient, or actually unsafe.</p>
        </article>
        <article class="card reveal">
          <h3>What usually causes it</h3>
          <p>We explain the likely causes in plain language so the reader understands why the issue happens.</p>
          <p>That might be age, overload, damaged parts, poor past work, water ingress, or a system that was never set up correctly.</p>
        </article>
        <article class="card reveal">
          <h3>What to do next</h3>
          <p>We close with a practical next step, whether that is booking a repair, checking the switchboard, or calling immediately.</p>
          <p>If there is an emergency, the article should make that obvious without making the reader hunt for the action to take.</p>
        </article>
      </div>
    </section>
"@
    Insert-BlockBeforeMainEnd -Path $file.FullName -Marker 'blog-post-expansion' -Block $block
}

$serviceFiles = Get-ChildItem -Path (Join-Path $site 'services') -Filter *.html -File
foreach ($file in $serviceFiles) {
    $raw = Get-Content -Path $file.FullName -Raw
    if ($raw -like '*service-page-expansion*') {
        continue
    }

    $heading = Get-HeadingText -Path $file.FullName
    $block = @"
    <section class="section service-page-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">Service detail expansion</h2>
          <p class="section-lead">$heading is never just one line of work. We look at the symptoms, the wider system, and the safest way to complete the job so the result is useful beyond the day of the call-out.</p>
          <p>In practice that means checking the visible fault, asking the right questions, testing the related circuit, and confirming whether the problem is isolated or part of a bigger issue. That is how you avoid paying twice for the same repair.</p>
          <p>We also think about how the job fits into the rest of the property. A good repair or installation should not create a new problem elsewhere, and it should leave the customer with a clear understanding of what was done and what to watch next.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>What this service includes</h3>
          <p>Fault diagnosis, practical repair options, safety checks, clear handover, and advice on any follow-up work.</p>
          <a class="btn btn-primary" href="../contact.html">Book $heading</a>
        </div>
      </div>
    </section>

    <section class="section service-page-expansion">
      <div class="container grid">
        <article class="card reveal">
          <h3>Before we begin</h3>
          <p>We confirm the problem, review the visible signs, and check whether any immediate safety action is needed.</p>
        </article>
        <article class="card reveal">
          <h3>During the job</h3>
          <p>We explain the work, complete the repair or installation carefully, and keep the site tidy as we go.</p>
        </article>
        <article class="card reveal">
          <h3>After completion</h3>
          <p>We test the result, explain what was found, and give practical advice if there is anything to monitor later.</p>
        </article>
      </div>
    </section>
"@
    Insert-BlockBeforeMainEnd -Path $file.FullName -Marker 'service-page-expansion' -Block $block
}

$areaFiles = Get-ChildItem -Path (Join-Path $site 'service-areas') -Filter *.html -File
foreach ($file in $areaFiles) {
    $raw = Get-Content -Path $file.FullName -Raw
    if ($raw -like '*service-area-expansion*') {
        continue
    }

    $heading = Get-HeadingText -Path $file.FullName
    $block = @"
    <section class="section service-area-expansion">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">Local area detail</h2>
          <p class="section-lead">$heading has its own mix of property types, wiring ages, and common fault patterns. We tailor our work to the property and the issue instead of treating every suburb the same.</p>
          <p>That matters because an apartment block, a terrace, a shopfront, and a newer family home all need different checks, different access planning, and different follow-up advice.</p>
          <p>When a customer searches a suburb page, they are usually trying to answer two things quickly: do you service here, and can you solve my exact problem without delay? This page should answer both clearly.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>What locals call us for</h3>
          <p>Power faults, lighting problems, switchboard issues, appliance circuits, and urgent repair work across Sydney NSW.</p>
          <a class="btn btn-primary" href="../contact.html">Request local help</a>
        </div>
      </div>
    </section>

    <section class="section service-area-expansion">
      <div class="container grid">
        <article class="card reveal">
          <h3>Properties we see</h3>
          <p>We regularly work in homes, units, small businesses, and renovation projects across the local area.</p>
        </article>
        <article class="card reveal">
          <h3>Typical requests</h3>
          <p>Customers ask for repairs, safety checks, lighting changes, and emergency troubleshooting when power is unstable.</p>
        </article>
        <article class="card reveal">
          <h3>Why speed matters</h3>
          <p>The faster a fault is found, the lower the risk of repeat trips, hidden damage, or downtime for the property.</p>
        </article>
      </div>
    </section>
"@
    Insert-BlockBeforeMainEnd -Path $file.FullName -Marker 'service-area-expansion' -Block $block
}

Write-Output 'CONTENT_EXPANSION_COMPLETE'