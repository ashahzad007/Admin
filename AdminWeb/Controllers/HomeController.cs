using AdminWeb.Models;
using AdminWeb.Repositories.Contract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace AdminWeb.Controllers
{
   // [Authorize(Roles = "Admin")]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
      
        private readonly IGenericRepository<Person> _personRepository;
        private readonly IGenericRepository<Location> _locationRepository;

        public HomeController(ILogger<HomeController> logger, IGenericRepository<Person> personRepository, IGenericRepository<Location> locationRepository)
        {
            _logger = logger;
            _personRepository = personRepository;
            _locationRepository = locationRepository;
        }

        public async Task<IActionResult> Index()
        {
            List<Location> cl = new List<Location>();
            cl =  _locationRepository.GetList().Result.ToList();
            cl.Insert(0, new Location { Id = 0, LocationName = "--Select Location Name--" });
            Location location = new Location();
            location.Listoflocations = cl;
            ViewBag.message = cl;
           

            return View();
        }

        [HttpGet]

        //DATA FROM ADO.NET 
        public async Task<IActionResult> GetPersonList()
        {
            List<Person> _personList = await _personRepository.GetList();
            return View(_personList);
        }

        [HttpPost]

        //DATA FROM ADO.NET 
        public async Task<IActionResult> GetPersonList(string SerachTxt)
        {
            List<Person> _personList = await _personRepository.GetList();
            if (SerachTxt !=null)
            {
                _personList = _personRepository.GetList().Result.Where(x => x.Name.Contains(SerachTxt)).ToList();
            }
            return View(_personList);
        }

        [HttpGet]
        public IActionResult SavePerson()
        {
            
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SavePerson(Person model)
        {
            bool _result = await _personRepository.Save(model);
            ModelState.Clear();
            return RedirectToAction("Index");
        }


       

        public IActionResult Privacy()
        {
            return View();
        }
        
        [HttpGet]
        public IActionResult Edit(int id)
        {
            var row = _personRepository.GetList().Result.Find(x => x.Id == id);
            return View(row);
        }


        [HttpPost]
        public async Task<IActionResult> Edit(int? id, Person model)
        {
            bool _result = await _personRepository.Edit(model);
            ModelState.Clear(); //CLEAR FORM DATA
            return RedirectToAction("Index");
        }


        [HttpGet]
        public IActionResult Delete(int? id)
        {
            var row = _personRepository.GetList().Result.Find(x => x.Id == id);
            return View(row);
        }


        [HttpPost]
        public async Task<IActionResult> DeleteAsync(int? id , Person model)
        {
            bool _result = await _personRepository.Delete(id);
            ModelState.Clear(); //CLEAR FORM DATA
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            var row = _personRepository.GetList().Result.Find(x => x.Id == id);
            return View(row);
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}