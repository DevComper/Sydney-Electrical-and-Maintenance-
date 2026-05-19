const transition = document.getElementById("page-transition");
const navToggle = document.querySelector(".nav-toggle");
const primaryNav = document.querySelector(".primary-nav");
const introDurationMS = 1700;
const introSeenKey = "sem_intro_seen";

if (transition) {
  const introSeen = sessionStorage.getItem(introSeenKey) === "1";
  if (introSeen) {
    transition.classList.add("is-hidden", "is-disabled");
  } else {
    document.body.classList.add("no-scroll-transition");
    window.addEventListener("load", () => {
      setTimeout(() => {
        transition.classList.add("is-hidden");
        document.body.classList.remove("no-scroll-transition");
        sessionStorage.setItem(introSeenKey, "1");
      }, introDurationMS);
    });
  }
}

if (navToggle && primaryNav) {
  navToggle.addEventListener("click", () => {
    const isOpen = primaryNav.classList.toggle("is-open");
    navToggle.setAttribute("aria-expanded", String(isOpen));
    if (!isOpen) {
      document
        .querySelectorAll(".nav-dropdown.is-open")
        .forEach((dropdown) => dropdown.classList.remove("is-open"));
    }
  });
}

document.querySelectorAll(".nav-dropdown > button").forEach((button) => {
  button.addEventListener("click", (event) => {
    if (window.innerWidth > 980) {
      return;
    }
    event.preventDefault();
    const parent = button.closest(".nav-dropdown");
    if (parent) {
      parent.classList.toggle("is-open");
    }
  });
});

const revealItems = document.querySelectorAll(".reveal");
if ("IntersectionObserver" in window && revealItems.length) {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.2 }
  );
  revealItems.forEach((item) => observer.observe(item));
} else {
  revealItems.forEach((item) => item.classList.add("is-visible"));
}
