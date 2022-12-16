using AdminWeb.Models;
using AdminWeb.Repositories.Contract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace AdminWeb.Controllers
{
   // [Authorize(Roles = "Admin")]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
      
        private readonly IGenericRepository<Person> _personRepository;

        public HomeController(ILogger<HomeController> logger, IGenericRepository<Person> personRepository)
        {
            _logger = logger;
            _personRepository = personRepository;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]

        //DATA FROM ADO.NET 
        public async Task<IActionResult> GetPersonList()
        {
            List<Person> _personList = await _personRepository.GetList();
            return View(_personList);
        }

        

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}