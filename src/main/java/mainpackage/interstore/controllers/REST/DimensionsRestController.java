package mainpackage.interstore.controllers.REST;

import mainpackage.interstore.model.DTOs.BrandDTO;
import mainpackage.interstore.model.DTOs.DimensionsDTO;
import mainpackage.interstore.service.DimensionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api/dimensions")
public class DimensionsRestController {
    private final DimensionsService dimensionsService;
    @Autowired
    public DimensionsRestController(DimensionsService dimensionsService) {
        this.dimensionsService = dimensionsService;
    }

    //CREATE
    @PostMapping
    public ResponseEntity<?> createDimensions(@RequestBody DimensionsDTO dimensionsDTO) throws Exception {
        dimensionsService.create(dimensionsDTO);
        return ResponseEntity.ok("Dimension successfully created");
    }
}
