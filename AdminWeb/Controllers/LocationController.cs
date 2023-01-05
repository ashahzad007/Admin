using AdminWeb.Models;
using AdminWeb.Repositories.Contract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System;

namespace AdminWeb.Controllers
{
    // [Authorize(Roles = "Admin")]
    public class LocationController : Controller
    {
        private readonly ILogger<LocationController> _logger;

        private readonly IGenericRepository<Location> _locationRepository;

        public LocationController(ILogger<LocationController> logger, IGenericRepository<Location> locationRepository)
        {
            _logger = logger;
            _locationRepository = locationRepository;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]

        //DATA FROM ADO.NET 
        public async Task<IActionResult> GetLocationList()
        {
            List<Location> _locationList = await _locationRepository.GetList();
            return View(_locationList);
        }

        [HttpPost]

        //DATA FROM ADO.NET 
        public async Task<IActionResult> GetLocationList(string SerachTxt)
        {
            List<Location> _locationList = await _locationRepository.GetList();
            if (SerachTxt != null)
            {
                _locationList = _locationRepository.GetList().Result.Where(x => x.LocationName.Contains(SerachTxt)).ToList();
            }
            return View(_locationList);
        }

        [HttpGet]
        public IActionResult SaveLocation()
        {

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SaveLocation(Location model)
        {
            bool _result = await _locationRepository.Save(model);
            ModelState.Clear();
            return RedirectToAction("Index");
        }


        [HttpPost]
        public JsonResult Add([FromBody] Location modelX) // [FromBody] is very Important to receive Data
        {
            var result = _locationRepository.Save(modelX);
            ModelState.Clear();
            string status = "";
            status = "Saved";
            return Json(status);

        }

            public IActionResult Privacy()
        {
            ViewBag.Value = "HELLO";
            return View();
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var row = _locationRepository.GetList().Result.Find(x => x.Id == id);
            ViewBag.LocationId = id;
            ViewBag.LocationId1 = row.Id;
            // very Important step to route another controller with Id
            return RedirectToAction("MainTab", "AssetMaster", new { area = "" , Id= id });
            

        }


        [HttpPost]
        public async Task<IActionResult> Edit(int? id, Location model)
        {
            bool _result = await _locationRepository.Edit(model);
            ViewBag.LocationId = id;
            ModelState.Clear(); //CLEAR FORM DATA
            return RedirectToAction("Index");
        }


        [HttpGet]
        public IActionResult Delete(int? id)
        {
            var row = _locationRepository.GetList().Result.Find(x => x.Id == id);
            return View(row);
        }


        [HttpPost]
        public async Task<IActionResult> DeleteAsync(int? id, Person model)
        {
            bool _result = await _locationRepository.Delete(id);
            ModelState.Clear(); //CLEAR FORM DATA
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            var row = _locationRepository.GetList().Result.Find(x => x.Id == id);
            return View(row);
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}