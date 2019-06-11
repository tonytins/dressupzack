// Anthony Wilcox licenses this file to you under the GPL license.
// See the LICENSE file in the project root for more information.
using Godot;

public enum ClothingLayer
{
    Shirts,
    Pants,
    Undies,
    Accessory
}

public class GameScn : Node
{

    void ChangeClothes(string path, ClothingLayer clothingLayer)
    {
        var texture = ResourceLoader.Load<Texture>($"res://sprites/{path}");

        switch (clothingLayer)
        {
            case ClothingLayer.Shirts:
                var top = GetNode<Sprite>("Nathan/Top");
                top.Texture = texture;
                break;
            case ClothingLayer.Pants:
                var bottom = GetNode<Sprite>("Nathan/Bottom");
                bottom.Texture = texture;
                break;
            case ClothingLayer.Undies:
                var undies = GetNode<Sprite>("Nathan/Undies");
                undies.Texture = texture;
                break;
            case ClothingLayer.Accessory:
                var accessory = GetNode<Sprite>("Nathan/Accessory");
                accessory.Texture = texture;
                break;
        }
    }

    void ChangeClothes(ClothingLayer clothingLayer)
    {
        var blankTopPath = "tops_placeholder.png";
        var blankBottomPath = "bottoms_placeholder.png";

        switch (clothingLayer)
        {
            case ClothingLayer.Shirts:
                ChangeClothes(blankTopPath, ClothingLayer.Shirts);
                break;
            case ClothingLayer.Pants:
                ChangeClothes(blankBottomPath, ClothingLayer.Pants);
                break;
            case ClothingLayer.Accessory:
                ChangeClothes(blankTopPath, ClothingLayer.Accessory);
                break;
        }
    }

    TextureButton ClothesButton(string path, ClothingLayer clothingType)
    {
        switch (clothingType)
        {
            case ClothingLayer.Accessory:
                return GetNode<TextureButton>($"Clothes/Wordrobe/Accessoires/AccsGrid/{path}");
            case ClothingLayer.Undies:
                return GetNode<TextureButton>($"Clothes/Wordrobe/Underwear/UndiesGrid/{path}");
            default:
            case ClothingLayer.Pants:
                return GetNode<TextureButton>($"Clothes/Wordrobe/Pants/PantsGrid/{path}");
            case ClothingLayer.Shirts:
                return GetNode<TextureButton>($"Clothes/Wordrobe/Shirts/ShirtsGrid/{path}");
        }
    }

    public override void _Process(float delta)
    {
        // Accessories
        // ====================================================

        if (ClothesButton("CanonCam", ClothingLayer.Accessory).Pressed)
            ChangeClothes("camera.png", ClothingLayer.Accessory);

        //if (ClothesButton("RemoveAccessory", ClothingLayer.Accessory).Pressed)
        //    ChangeClothes(ClothingLayer.Accessory);

        // Pants
        // ====================================================

        if (ClothesButton("Jeans", ClothingLayer.Pants).Pressed)
            ChangeClothes("jeans.svg", ClothingLayer.Pants);

        if (ClothesButton("Sweats", ClothingLayer.Pants).Pressed)
            ChangeClothes("sweat_pants.svg", ClothingLayer.Pants);

        if (ClothesButton("BeatUpJeans", ClothingLayer.Pants).Pressed)
            ChangeClothes("beat_up_jeans.svg", ClothingLayer.Pants);

        if (ClothesButton("BlueCamoJeans", ClothingLayer.Pants).Pressed)
            ChangeClothes("blue_camo_jeans.svg", ClothingLayer.Pants);

        //if (ClothesButton("RemovePants", ClothingLayer.Pants).Pressed)
        //    ChangeClothes(ClothingLayer.Pants);

        // Underwear
        // ====================================================

        if (ClothesButton("Briefs", ClothingLayer.Undies).Pressed)
            ChangeClothes("briefs.svg", ClothingLayer.Undies);

        if (ClothesButton("ZBriefs", ClothingLayer.Undies).Pressed)
            ChangeClothes("z_briefs.svg", ClothingLayer.Undies);

        if (ClothesButton("Fundosi", ClothingLayer.Undies).Pressed)
            ChangeClothes("fundosi.svg", ClothingLayer.Undies);

        if (ClothesButton("OwOCensor", ClothingLayer.Undies).Pressed)
            ChangeClothes("owo_censor.svg", ClothingLayer.Undies);

        // Shirts
        // ====================================================

        if (ClothesButton("TrainHoodie", ClothingLayer.Shirts).Pressed)
            ChangeClothes("train_hoodie.svg", ClothingLayer.Shirts);

        if (ClothesButton("Sweatshirt", ClothingLayer.Shirts).Pressed)
            ChangeClothes("old_sweatshirt.svg", ClothingLayer.Shirts);
    }
}
