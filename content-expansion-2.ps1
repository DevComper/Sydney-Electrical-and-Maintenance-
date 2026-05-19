param()

$site = 'C:\Users\advik.DESKTOP-GNPI7JP\OneDrive\Desktop\Elec and Plum Web\Sydney elctrical and maintaince website'

function Insert-UniqueBlock {
    param(
        [string]$Path,
        [string]$Marker,
        [string]$Block
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

Insert-UniqueBlock -Path (Join-Path $site 'index.html') -Marker 'homepage-depth-2' -Block @'
    <section class="section homepage-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">What makes a better electrical page</h2>
          <p class="section-lead">Strong service pages do four things at once. They explain the work, they show the warning signs, they answer the pricing and timing questions, and they tell the reader what to do next.</p>
          <p>That is why the homepage also needs more than a quick hero and a few cards. It should show the reader that the company handles emergency work, planned work, home work, and commercial work with enough depth to be trusted before the phone call happens.</p>
          <p>We are building the site that way on purpose. The goal is to make it feel like a real local business site with enough detail for customers and search engines to understand the service offering properly.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Need a quick path?</h3>
          <p>If you already know the issue, jump straight to the relevant service page. If not, call and we will narrow it down with you.</p>
          <a class="btn btn-primary" href="services.html">Browse services</a>
        </div>
      </div>
    </section>

    <section class="section homepage-depth-2">
      <div class="container grid">
        <article class="card reveal">
          <h3>Emergency faults</h3>
          <p>We prioritise the jobs that affect safety or shut down power entirely, because those are the ones that can get worse quickly.</p>
        </article>
        <article class="card reveal">
          <h3>Renovation planning</h3>
          <p>We help homeowners and builders plan the electrical part of a project so the wiring supports the new layout instead of fighting it.</p>
        </article>
        <article class="card reveal">
          <h3>Ongoing maintenance</h3>
          <p>For businesses and managed properties, preventative maintenance is often cheaper than emergency work, especially when downtime matters.</p>
        </article>
      </div>
    </section>
'@

Insert-UniqueBlock -Path (Join-Path $site 'about.html') -Marker 'about-depth-2' -Block @'
    <section class="section about-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">How we think about the customer experience</h2>
          <p class="section-lead">Good electrical work is not only about the fix. It is also about how clearly the electrician communicates, whether the quote makes sense, and whether the outcome feels safer and easier to live with after the work is done.</p>
          <p>We keep that in mind when we write copy, scope work, and plan the job. If the issue is simple, we make the path simple. If the issue points to a broader problem, we explain the bigger picture without turning it into jargon.</p>
          <p>That approach suits Sydney customers because many properties have a mix of old and new work. People need practical advice that respects the property, the budget, and the urgency of the job.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>What we value</h3>
          <p>Useful advice, clean finishes, proper testing, and the kind of handover that leaves no confusion about what was done.</p>
          <a class="btn btn-primary" href="reviews.html">See reviews</a>
        </div>
      </div>
    </section>
'@

Insert-UniqueBlock -Path (Join-Path $site 'services.html') -Marker 'services-depth-2' -Block @'
    <section class="section services-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">Service selection guide</h2>
          <p class="section-lead">People usually arrive here with a problem, not a category. We want the services page to help them translate the problem into the right electrical job as quickly as possible.</p>
          <p>If there is power loss, the decision is likely about fault finding, switchboards, or restoration. If there is a new fixture, fan, charger, or fit-out, the decision is likely about installation. If something is flickering, sparking, buzzing, or not working properly, repair is usually the right path to investigate first.</p>
          <p>That guidance is not just helpful for the customer. It also makes the site more useful for local search because each service page has a clear job to do and a clear context for the keywords it is targeting.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Still not sure?</h3>
          <p>Call us and we will tell you whether you need a repair, an installation, an upgrade, or an emergency response.</p>
          <a class="btn btn-primary" href="tel:0412396505">Call now</a>
        </div>
      </div>
    </section>
'@

Insert-UniqueBlock -Path (Join-Path $site 'service-areas.html') -Marker 'service-areas-depth-2' -Block @'
    <section class="section service-areas-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">What suburb pages should add</h2>
          <p class="section-lead">A suburb page should not just repeat the same company bio with a different place name. It should give a reader a reason to trust that the business works in that area often enough to understand the common property types and common faults.</p>
          <p>That can mean talking about apartments, terraces, family homes, or commercial buildings in a way that feels specific to the area. It also means explaining response speed, coverage, and the type of electrical work most likely to come up there.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Coverage that feels local</h3>
          <p>Every suburb page should make it obvious that the team services the area, not just the city in general.</p>
          <a class="btn btn-primary" href="contact.html">Check a suburb</a>
        </div>
      </div>
    </section>
'@

Insert-UniqueBlock -Path (Join-Path $site 'blog.html') -Marker 'blog-hub-depth-2' -Block @'
    <section class="section blog-hub-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">How the blog should read</h2>
          <p class="section-lead">Real blog content has a point of view. It explains what the issue is, what causes it, how serious it is, and what the customer should do next if they want the safest result.</p>
          <p>That is the level we need here. Not filler, not one-paragraph summaries, but practical article content that a homeowner or business manager can actually use when they are deciding whether to book an electrician.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Need more articles?</h3>
          <p>We can expand the blog with switchboard guides, lighting guides, emergency planning, and electrical upgrade planning.</p>
          <a class="btn btn-primary" href="contact.html">Request a topic</a>
        </div>
      </div>
    </section>
'@

Insert-UniqueBlock -Path (Join-Path $site 'reviews.html') -Marker 'reviews-depth-2' -Block @'
    <section class="section reviews-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">Why the review page matters</h2>
          <p class="section-lead">A dedicated review page gives the customer a clean place to verify trust signals without interrupting the homepage flow.</p>
          <p>That page also gives the business a stronger place to link from the homepage and service pages, which is useful for both user confidence and local SEO.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Check the latest feedback</h3>
          <p>Read the reviews, then come back if you want a quote, an emergency response, or a comparison against another service.</p>
          <a class="btn btn-primary" href="https://share.google/2CSlGpySI0W5f610p" target="_blank" rel="noopener">Open profile</a>
        </div>
      </div>
    </section>
'@

Get-ChildItem -Path (Join-Path $site 'blog') -Filter *.html -File | ForEach-Object {
    $heading = Get-HeadingText -Path $_.FullName
    Insert-UniqueBlock -Path $_.FullName -Marker 'blog-post-depth-2' -Block @"
    <section class="section blog-post-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">Why this matters in Sydney</h2>
          <p class="section-lead">$heading is not just a generic topic. In Sydney, property age, climate, wiring history, and household load patterns all affect the way this problem shows up and how it should be handled.</p>
          <p>That is why a good article should not stop at a definition. It should explain the local context, the risk level, the common mistakes, and the point where professional help becomes the smart option instead of an optional one.</p>
          <p>Readers do not want fluff. They want enough detail to understand what is happening and enough practical advice to avoid making it worse before a licensed electrician gets involved.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Read this before you book</h3>
          <p>If the problem is recurring, making noise, producing heat, or causing repeated trips, treat it as a proper fault and not a minor inconvenience.</p>
          <a class="btn btn-primary" href="../contact.html">Get help</a>
        </div>
      </div>
    </section>

    <section class="section blog-post-depth-2">
      <div class="container grid">
        <article class="card reveal">
          <h3>Common mistakes</h3>
          <p>People often assume the issue is isolated when it may actually be a sign of a larger load, wiring, or switchboard problem.</p>
        </article>
        <article class="card reveal">
          <h3>What a proper electrician checks</h3>
          <p>Good diagnosis means testing the circuit, checking the equipment, and making sure the fix addresses the cause, not only the symptom.</p>
        </article>
        <article class="card reveal">
          <h3>When to call immediately</h3>
          <p>If the issue creates heat, smell, sparking, repeated tripping, or power loss, it should move from a reading topic to an urgent service call.</p>
        </article>
      </div>
    </section>
"@
}

Get-ChildItem -Path (Join-Path $site 'services') -Filter *.html -File | ForEach-Object {
    $heading = Get-HeadingText -Path $_.FullName
    Insert-UniqueBlock -Path $_.FullName -Marker 'service-page-depth-2' -Block @"
    <section class="section service-page-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">How to think about this job</h2>
          <p class="section-lead">$heading should be chosen because it matches the problem you are seeing, not just because it sounds close. That is why the page needs to explain the signs, the likely causes, and the difference between a quick repair and a broader upgrade.</p>
          <p>For some properties, the key question is whether the issue is urgent. For others, the question is whether the current setup still suits the way the property is used. Either way, the page needs enough detail to help the reader decide with confidence.</p>
          <p>We also include more context about safety, timing, and what a clean completion should look like. That level of detail is what makes the page useful instead of thin.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Job outcome</h3>
          <p>The right result is a safe, tested, clearly explained fix or installation that makes the property easier to live or work in.</p>
          <a class="btn btn-primary" href="../contact.html">Book now</a>
        </div>
      </div>
    </section>

    <section class="section service-page-depth-2">
      <div class="container grid">
        <article class="card reveal">
          <h3>Signs people notice first</h3>
          <p>Repeated faults, strange sounds, flickering, heat, missing power, or equipment that no longer behaves normally.</p>
        </article>
        <article class="card reveal">
          <h3>What usually changes the scope</h3>
          <p>Age of the wiring, access, load on the circuit, the condition of the switchboard, and whether the work is part of a larger project.</p>
        </article>
        <article class="card reveal">
          <h3>What a good handover includes</h3>
          <p>Testing, labeling where needed, and a straightforward explanation of what was repaired or installed.</p>
        </article>
      </div>
    </section>
"@
}

Get-ChildItem -Path (Join-Path $site 'service-areas') -Filter *.html -File | ForEach-Object {
    $heading = Get-HeadingText -Path $_.FullName
    Insert-UniqueBlock -Path $_.FullName -Marker 'service-area-depth-2' -Block @"
    <section class="section service-area-depth-2">
      <div class="container split">
        <div class="reveal">
          <h2 class="section-title">More local context</h2>
          <p class="section-lead">$heading often includes a mix of property types, access conditions, and common fault patterns. That is why a local page should say a bit more than just the suburb name and a promise to service it.</p>
          <p>It should explain the likely job types in the area, the reasons someone might need an electrician there, and the kind of response speed customers can reasonably expect when they call.</p>
        </div>
        <div class="highlight-band reveal">
          <h3>Nearby support</h3>
          <p>If you are just outside the suburb boundary, we can still often help if the job is in the wider Sydney metro area.</p>
          <a class="btn btn-primary" href="../contact.html">Ask coverage</a>
        </div>
      </div>
    </section>

    <section class="section service-area-depth-2">
      <div class="container grid">
        <article class="card reveal">
          <h3>Local property mix</h3>
          <p>Homes, units, commercial premises, and renovation sites all need different approaches to access and fault finding.</p>
        </article>
        <article class="card reveal">
          <h3>Common local calls</h3>
          <p>Switchboard faults, lighting issues, power restoration, and safety checks are all common reasons to book a local electrician.</p>
        </article>
        <article class="card reveal">
          <h3>Why proximity helps</h3>
          <p>Being nearby usually means faster attendance, clearer scheduling, and less downtime when the issue is urgent.</p>
        </article>
      </div>
    </section>
"@
}

Write-Output 'CONTENT_DEPTH_2_COMPLETE'