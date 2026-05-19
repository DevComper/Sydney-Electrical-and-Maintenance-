const fs = require('fs');
const path = require('path');

const root = path.resolve(__dirname, '..');
const serviceTemplatePath = path.join(root, 'services', 'electrical-panel-upgrading.html');
const blogTemplatePath = path.join(root, 'blog', 'lower-electricity-bill.html');

const serviceTemplate = fs.readFileSync(serviceTemplatePath, 'utf8');
const blogTemplate = fs.readFileSync(blogTemplatePath, 'utf8');

const servicePages = [
  { file: 'light-fixture-installation.html', title: 'Light Fixture Installation | Sydney Electrical and Maintenance', heading: 'Light Fixture Installation', subtitle: 'Safe Lighting Installations Done Right' },
  { file: 'outdoor-lighting-installation.html', title: 'Outdoor Lighting Installation | Sydney Electrical and Maintenance', heading: 'Outdoor Lighting Installation', subtitle: 'Outdoor Lighting That Works and Lasts' },
  { file: 'electrical-socket-switch-installation.html', title: 'Electrical Socket and Switch Installation | Sydney Electrical and Maintenance', heading: 'Electrical Socket and Switch Installation', subtitle: 'Safe Power Points and Switches for Every Room' },
  { file: 'electrical-socket-switch-relocation.html', title: 'Electrical Socket and Switch Relocation | Sydney Electrical and Maintenance', heading: 'Electrical Socket and Switch Relocation', subtitle: 'Move Sockets and Switches Where They Work Better' },
  { file: 'electrical-socket-switch-repair.html', title: 'Electrical Socket and Switch Repair | Sydney Electrical and Maintenance', heading: 'Electrical Socket and Switch Repair', subtitle: 'Repair Faulty Power Points and Switches' },
  { file: 'electric-car-charger-installation.html', title: 'Electric Car Charger Installation | Sydney Electrical and Maintenance', heading: 'Electric Car Charger Installation', subtitle: 'Safe EV Charger Installations for Homes and Businesses' },
  { file: 'remodelling.html', title: 'Remodelling | Sydney Electrical and Maintenance', heading: 'Remodelling', subtitle: 'Electrical Work for Renovations and Remodels' },
  { file: 'general-repairs.html', title: 'General Repairs | Sydney Electrical and Maintenance', heading: 'General Repairs', subtitle: 'Reliable Electrical Repairs Across Sydney' },
  { file: 'fan-installation.html', title: 'Fan Installation | Sydney Electrical and Maintenance', heading: 'Fan Installation', subtitle: 'Safe Ceiling Fan Installation and Upgrades' },
  { file: 'ground-wire-installation.html', title: 'Ground Wire Installation | Sydney Electrical and Maintenance', heading: 'Ground Wire Installation', subtitle: 'Safe Earthing and Grounding Work' },
  { file: 'security-system-installation.html', title: 'Security System Installation | Sydney Electrical and Maintenance', heading: 'Security System Installation', subtitle: 'Reliable Electrical Work for Security Systems' },
  { file: 'installation.html', title: 'Installation | Sydney Electrical and Maintenance', heading: 'Installation', subtitle: 'General Electrical Installation Work' },
  { file: 'fan-repair.html', title: 'Fan Repair | Sydney Electrical and Maintenance', heading: 'Fan Repair', subtitle: 'Repair Noisy or Faulty Ceiling Fans' },
  { file: 'light-fixture-repair.html', title: 'Light Fixture Repair | Sydney Electrical and Maintenance', heading: 'Light Fixture Repair', subtitle: 'Fast Diagnostics for Faulty Lighting' },
  { file: 'electrical-panel-repair.html', title: 'Electrical Panel Repair | Sydney Electrical and Maintenance', heading: 'Electrical Panel Repair', subtitle: 'Fast Repairs for Faulty Switchboards' },
  { file: 'electrical-panel-replacement-upgrade.html', title: 'Electrical Panel Replacement or Upgrading | Sydney Electrical and Maintenance', heading: 'Electrical Panel Replacement or Upgrading', subtitle: 'Modern Switchboard Replacement and Upgrades' },
  { file: 'electrical-power-restoration.html', title: 'Electrical Power Restoration | Sydney Electrical and Maintenance', heading: 'Electrical Power Restoration', subtitle: 'Fast Restoration When the Power Goes Out' },
  { file: 'commercial-electrical-services.html', title: 'Commercial Electrical Services | Sydney Electrical and Maintenance', heading: 'Commercial Electrical Services', subtitle: 'Reliable Electrical Support for Businesses' },
  { file: 'industrial-electrical-services.html', title: 'Industrial Electrical Services | Sydney Electrical and Maintenance', heading: 'Industrial Electrical Services', subtitle: 'Industrial Electrical Support for Heavy-Duty Sites' },
  { file: 'residential-electrical-services.html', title: 'Residential Electrical Services | Sydney Electrical and Maintenance', heading: 'Residential Electrical Services', subtitle: 'Safe Electrical Work for Sydney Homes' }
];

for (const page of servicePages) {
  let html = serviceTemplate;
  html = html.replace(/<title>.*?<\/title>/, `<title>${page.title}</title>`);
  html = html.replace(/<meta name="description" content=".*?" \/>/, `<meta name="description" content="${page.heading} across Sydney. Safe, compliant, and built around the needs of the property." />`);
  html = html.replace('Professional Electrical Panel Upgrading Sydney', page.heading);
  html = html.replace('Affordable Switchboard Replacement Guaranteed', page.subtitle);
  html = html.replace(/Over X years of combined experience/g, 'Over 7 years of combined experience');
  html = html.replace(/Over 7 years of combined experience/g, 'Over 7 years of combined experience');
  fs.writeFileSync(path.join(root, 'services', page.file), html, 'utf8');
}

const blogPages = [
  {
    file: 'emergency-power-outage.html',
    title: 'What To Do First When the Power Goes Out | Sydney Electrical and Maintenance',
    headline: 'What to do first when the power goes out',
    badge: 'Emergencies',
    description: 'Step-by-step actions to take during a power outage before an emergency electrician arrives.'
  },
  {
    file: 'ev-charger-installation-cost.html',
    title: 'The Ultimate Guide to Installing an EV Charger at Home | Sydney Electrical and Maintenance',
    headline: 'The Ultimate Guide to Installing an EV Charger at Home',
    badge: 'EV Chargers',
    description: 'EV charger installation cost and home EV charging station setup: price ranges, panel requirements, rebates and why hire a certified electrician.'
  }
];

for (const page of blogPages) {
  let html = blogTemplate;
  html = html.replace(/<title>.*?<\/title>/, `<title>${page.title}</title>`);
  html = html.replace(/<meta name="description" content=".*?" \/>/, `<meta name="description" content="${page.description}" />`);
  html = html.replace(/"headline": "[^"]*"/, `"headline": "${page.headline}"`);
  html = html.replace(/"description": "[^"]*"/, `"description": "${page.description}"`);
  html = html.replace(/"mainEntityOfPage": \{"@type": "WebPage", "@id": "\.\.\/blog\/[^"]*"\}/, `"mainEntityOfPage": {"@type": "WebPage", "@id": "../blog/${page.file}"}`);
  html = html.replace(/<span class="badge">[^<]*<\/span>/, `<span class="badge">${page.badge}</span>`);
  html = html.replace(/<h1>[^<]*<\/h1>/, `<h1>${page.headline}</h1>`);

  if (page.file === 'emergency-power-outage.html') {
    html = html.replace('Between rising network charges, increased demand during heatwaves, and older homes using outdated electrical systems, it is easy to waste hundreds of dollars without even realising it.', 'Power outages are stressful, but the first few minutes matter most. Staying calm and checking the right things in the right order can keep the fault safe while you wait for help.');
    html = html.replace('The good news? You do not need to sacrifice comfort, live in the dark, or constantly monitor every switch in your home. By making a few smart, modern upgrades, you can dramatically reduce your energy usage, and the savings happen automatically in the background.', 'The good news? You do not need to guess what to do. By checking the street, the switchboard, and the safety signs first, you can separate a simple outage from an urgent fault.');
    html = html.replace('Below are 7 practical, high-impact upgrades that will cut your power bill without changing your lifestyle.', 'Below are 7 practical steps for handling a blackout safely and knowing when to call a licensed electrician.');
    html = html.replace('<h2 class="section-title">1. Swap Old Halogen Downlights for Modern LEDs</h2>', '<h2 class="section-title">1. Check whether the outage is local</h2>');
    html = html.replace('If your home still uses halogen downlights, you are paying far more than you should.', 'Look outside first. If neighbouring homes or the streetlights are also dark, the outage may be wider than your property.');
    html = html.replace('<h2 class="section-title">2. Upgrade to a Smart Thermostat</h2>', '<h2 class="section-title">2. Check the switchboard safely</h2>');
    html = html.replace('Heating and cooling account for nearly 50% of the average Sydney household\'s electricity bill. With humid summers and unpredictable temperature swings, AC units often run harder than necessary.', 'Locate the switchboard and check whether a breaker or safety switch has tripped. If you are unsure, stop and call a licensed electrician rather than forcing a reset.');
    html = html.replace('<h2 class="section-title">Is Your Switchboard Safe?</h2>', '<h2 class="section-title">3. Turn off heavy appliances</h2>');
    html = html.replace('If your circuit breakers trip when you run the AC, dryer, or kettle at the same time, your switchboard may be overloaded. This is not just an inconvenience, it is a safety risk.', 'Unplug large appliances before resetting anything. This reduces load and helps you see whether the fault was caused by one circuit or a wider issue.');
    html = html.replace('<h3>Book a switchboard safety inspection</h3>', '<h3>Call if the fault keeps returning</h3>');
    html = html.replace('<h2 class="section-title">3. Switch to DC Motor Ceiling Fans</h2>', '<h2 class="section-title">4. Watch for smoke, sparks, or burning smells</h2>');
    html = html.replace('Running your air conditioner all day is one of the fastest ways to rack up a huge bill. DC motor ceiling fans are a powerful, low-cost alternative.', 'If you smell burning, see sparks, or notice heat around fittings or the switchboard, move away from the area and treat it as an emergency.');
    html = html.replace('<h2 class="section-title">4. Kill “Phantom Power” with Smart Power Strips</h2>', '<h2 class="section-title">5. Know when the outage is an emergency</h2>');
    html = html.replace('Many appliances continue drawing electricity even when turned off. This is known as standby power or “phantom power”. Common culprits include TVs, soundbars, gaming consoles, desktop computers, chargers, and modems and routers.', 'A power loss that affects part of the property can still be urgent if it involves heat, smoke, water, or damage to wiring or equipment.');
    html = html.replace('<h2 class="section-title">5. Install Motion Sensors for Outdoor Lights</h2>', '<h2 class="section-title">6. What the electrician will test</h2>');
    html = html.replace('Outdoor lights are often left on for hours, sometimes all night, especially in driveways, side paths, and backyards.', 'A proper diagnosis includes testing the affected circuits, checking the switchboard, and identifying whether the issue is isolated or part of a larger fault.');
    html = html.replace('<h2 class="section-title">6. Look for High Star-Ratings on Kitchen Appliances</h2>', '<h2 class="section-title">7. What to tell the electrician</h2>');
    html = html.replace('Your fridge runs 24/7, it is one of the biggest energy users in your home. Older fridges and dishwashers use significantly more electricity, cycle on and off loudly, struggle to maintain temperature, and can cost hundreds more per year to operate.', 'Tell the electrician which rooms lost power, whether any breaker tripped, whether there was a storm, and whether you noticed any smell, sound, or visible damage.');
    html = html.replace('<h2 class="section-title">7. Install a Smart Energy Monitor in Your Fuse Box</h2>', '<h2 class="section-title">Frequently Asked Questions</h2>');
    html = html.replace('Most people only see their electricity usage every three months, long after the damage is done. A smart energy monitor gives you real-time visibility.', '');
    html = html.replace('Will changing to LED lights actually save noticeable money?', 'Is it safe to reset a breaker myself?');
    html = html.replace('Yes. Replacing a full home of halogens with LEDs can save hundreds of dollars per year, especially in homes with 20 or more downlights.', 'Yes, but only once. If it trips again immediately, stop and call a qualified electrician.');
    html = html.replace('Can a smart monitor be installed in any home?', 'What should I tell the electrician when I call?');
    html = html.replace('It requires a modern switchboard with automatic circuit breakers. If your home still uses ceramic fuses, you will need a switchboard upgrade first to ensure safety and compliance.', 'Tell them which circuits are affected, any smells or sounds, when it started, and whether it followed a storm or appliance change.');
    html = html.replace('What happens during a Home Energy Audit?', 'How quickly can you attend for an emergency?');
    html = html.replace('A technician will inspect your appliances, check your switchboard, identify outdated or unsafe wiring, test your lighting and insulation, and provide a simple checklist showing where your home is wasting electricity.', 'We offer 24/7 emergency attendance across Sydney — response times vary with location and time of day.');
    html = html.replace('Ready to reduce your power bill?', 'Ready to handle a blackout safely?');
    html = html.replace('Book a home energy audit or switchboard inspection and get a clear plan to lower costs without changing your lifestyle.', 'Book an emergency inspection and get a clear plan for restoring power safely.');
  }

  if (page.file === 'ev-charger-installation-cost.html') {
    html = html.replace('Between rising network charges, increased demand during heatwaves, and older homes using outdated electrical systems, it is easy to waste hundreds of dollars without even realising it.', 'EV charger installation costs vary depending on the switchboard, cable run, charger type, and whether the site needs extra work before the charger can be installed safely.');
    html = html.replace('The good news? You do not need to sacrifice comfort, live in the dark, or constantly monitor every switch in your home. By making a few smart, modern upgrades, you can dramatically reduce your energy usage, and the savings happen automatically in the background.', 'The good news? You do not need to guess the price before you start. By understanding the main factors that affect the installation quote, you can plan properly and avoid surprise costs.');
    html = html.replace('Below are 7 practical, high-impact upgrades that will cut your power bill without changing your lifestyle.', 'Below are 7 practical factors that shape the final EV charger installation cost.');
    html = html.replace('<h2 class="section-title">1. Swap Old Halogen Downlights for Modern LEDs</h2>', '<h2 class="section-title">1. Check the switchboard capacity first</h2>');
    html = html.replace('If your home still uses halogen downlights, you are paying far more than you should.', 'If your switchboard is already close to capacity, the charger may require extra work before installation can safely go ahead.');
    html = html.replace('<h2 class="section-title">2. Upgrade to a Smart Thermostat</h2>', '<h2 class="section-title">2. Measure the cable run and charger location</h2>');
    html = html.replace('Heating and cooling account for nearly 50% of the average Sydney household\'s electricity bill. With humid summers and unpredictable temperature swings, AC units often run harder than necessary.', 'The longer the cable run from the board to the charger, the more labour and materials are involved in the job.');
    html = html.replace('<h2 class="section-title">Is Your Switchboard Safe?</h2>', '<h2 class="section-title">3. Decide whether a load management option is needed</h2>');
    html = html.replace('If your circuit breakers trip when you run the AC, dryer, or kettle at the same time, your switchboard may be overloaded. This is not just an inconvenience, it is a safety risk.', 'Some homes can charge safely with load management, while others need a board or mains upgrade before the charger can be installed.');
    html = html.replace('<h3>Book a switchboard safety inspection</h3>', '<h3>Book a charger site check</h3>');
    html = html.replace('<h2 class="section-title">3. Switch to DC Motor Ceiling Fans</h2>', '<h2 class="section-title">4. Choose the right charger type</h2>');
    html = html.replace('Running your air conditioner all day is one of the fastest ways to rack up a huge bill. DC motor ceiling fans are a powerful, low-cost alternative.', 'Different charger types, smart features, and power levels can change the price and the setup required for the property.');
    html = html.replace('<h2 class="section-title">4. Kill “Phantom Power” with Smart Power Strips</h2>', '<h2 class="section-title">5. Account for compliance and protection</h2>');
    html = html.replace('Many appliances continue drawing electricity even when turned off. This is known as standby power or “phantom power”. Common culprits include TVs, soundbars, gaming consoles, desktop computers, chargers, and modems and routers.', 'A compliant charger install needs the right protection, cable size, earthing, and circuit design.');
    html = html.replace('<h2 class="section-title">5. Install Motion Sensors for Outdoor Lights</h2>', '<h2 class="section-title">6. Expect the quote to reflect real site conditions</h2>');
    html = html.replace('Outdoor lights are often left on for hours, sometimes all night, especially in driveways, side paths, and backyards.', 'Trenching, wall finishes, access issues, and where the vehicle parks all influence the final cost.');
    html = html.replace('<h2 class="section-title">6. Look for High Star-Ratings on Kitchen Appliances</h2>', '<h2 class="section-title">7. Book a site visit before you commit</h2>');
    html = html.replace('Your fridge runs 24/7, it is one of the biggest energy users in your home. Older fridges and dishwashers use significantly more electricity, cycle on and off loudly, struggle to maintain temperature, and can cost hundreds more per year to operate.', 'A site visit lets the electrician check the board, cable path, and charger location before the work starts, which avoids expensive surprises later.');
    html = html.replace('<h2 class="section-title">7. Install a Smart Energy Monitor in Your Fuse Box</h2>', '<h2 class="section-title">Frequently Asked Questions</h2>');
    html = html.replace('Most people only see their electricity usage every three months, long after the damage is done. A smart energy monitor gives you real-time visibility.', '');
    html = html.replace('Will changing to LED lights actually save noticeable money?', 'How much does a home EV charger cost installed?');
    html = html.replace('Yes. Replacing a full home of halogens with LEDs can save hundreds of dollars per year, especially in homes with 20 or more downlights.', 'Expect a range that depends on cable distance, charger type, panel capacity, and any extra work needed to bring the installation up to standard.');
    html = html.replace('Can a smart monitor be installed in any home?', 'Do I need a new switchboard for an EV charger?');
    html = html.replace('It requires a modern switchboard with automatic circuit breakers. If your home still uses ceramic fuses, you will need a switchboard upgrade first to ensure safety and compliance.', 'Not always, but the switchboard must have enough capacity and the right protection before the charger is installed safely.');
    html = html.replace('What happens during a Home Energy Audit?', 'Can you install chargers in apartments or shared driveways?');
    html = html.replace('A technician will inspect your appliances, check your switchboard, identify outdated or unsafe wiring, test your lighting and insulation, and provide a simple checklist showing where your home is wasting electricity.', 'Yes — we work with building managers and strata to design compliant shared or private installations.');
    html = html.replace('Ready to reduce your power bill?', 'Ready to power up your vehicle safely?');
    html = html.replace('Book a home energy audit or switchboard inspection and get a clear plan to lower costs without changing your lifestyle.', 'Contact us for a custom EV charger setup quote that fits the property safely.');
  }

  fs.writeFileSync(path.join(root, 'blog', page.file), html, 'utf8');
}
