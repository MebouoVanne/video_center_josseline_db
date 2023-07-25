<?php

namespace App\Controller;

use App\Entity\Video;
use App\Form\VideoType;
use App\Repository\VideoRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class VideoController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(
        VideoRepository $videoRepository, 
        Request $request,
        PaginatorInterface $paginator,): Response
    {
        if ($this->getUser()){
            if (!$this->getUser()->isVerified()){
            $this->addFlash('info', "Votre adresse email n'est pas vérifié.");
            } 
            }
            

        $videos = $paginator->paginate(
            $videoRepository->findAll(),
            $request->query->getInt('page', 1),
            10
        );

    
        return $this->render('video/index.html.twig', [
        'videos'=>$videos,
            
        ]);
    }

    #[Route('/video/{id<[0-9]+>}', name: 'app_video_show', methods: 'GET')]
    public function show(Video $video): Response
    {
        return $this->render('video/show.html.twig', compact('video'));
    }

     #[Route('/video/create', name: 'app_video_create', methods:["GET","POST"])]
    public function create(
        Request $request,
        EntityManagerInterface $manager,
    ): Response
    {
        if ($this->getUser()){
            if ($this->getUser()->isVerified() == false) {
            $this->addFlash('error', 'Vous devez confirmer votre adresse e-mail!');
            return $this->redirectToRoute('app_home');
            } 
            }else{
            $this->addFlash('error', 'Vous devez vous connecter pour créer une vidéo!');
            return $this->redirectToRoute('app_login');
            }
            $video = new video;
            $form = $this->createForm(VideoType::class, $video);
            $form->handleRequest($request);
            if ($form->isSubmitted() && $form->isValid()) {
            $video -> setUser( $this->getUser());
            $manager->persist($video);
            $manager->flush();
            $this->addFlash(
                'success',
                'Votre vidéo a été ajouter avec succès !'
            );
    
            return $this->redirectToRoute('app_home');
 }
 return $this->render('video/create.html.twig', ['form' => $form->createView()]); 
    }

    #[Route('/video/{id<[0-9]+>}/edit', name: 'app_video_edit', methods:["GET","POST"])]
    public function edit(
        Request $request,
        EntityManagerInterface $manager,
        Video $video
    ): Response
    {
        if ($this->getUser()){
            if ($this->getUser()->isVerified() == false) {
            $this->addFlash('error', 'Vous devez confirmer votre adresse e-mail! pour éditer une vidéo');
            return $this->redirectToRoute('app_home');
            }else if ($video->getUser()->getEmail() !== $this->getUser()->getEmail()){
            $this->addFlash('error', "Vous devez être l'utilisateur ". $video->getUser()->getFirstname() . ' pour éditer !');
            return $this->redirectToRoute('app_home');
            } 
            }else{
            $this->addFlash('error', 'Vous devez vous connecter pour editer une vidéo!!');
            return $this->redirectToRoute('app_login');
            }
            
            $form = $this->createForm(VideoType::class, $video);
            $form->handleRequest($request);
            if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($video);
            $manager->flush();

            $this->addFlash(
                'success',
                'Votre video a été modifier avec succès !'
            );
    
            return $this->redirectToRoute('app_home');
 }
 return $this->render('video/edit.html.twig', ['form' => $form->createView()]); 
    }

    #[Route('/video/{id<[0-9]+>}/delete', name: 'app_video_delete')]
    public function delete(
        EntityManagerInterface $manager,
        Video $video
    ): Response
    {
        if ($this->getUser()){
            if ($this->getUser()->isVerified() == false) {
            $this->addFlash('error', 'Vous devez confirmer votre adresse e-mail! pour supprimer une vidéo');
            return $this->redirectToRoute('app_home');
            }else if ($video->getUser()->getEmail() !== $this->getUser()->getEmail()){
            $this->addFlash('error', "Vous devez être l'utilisateur ". $video->getUser()->getFirstname() . ' pour éditer !');
            return $this->redirectToRoute('app_home');
            } 
            }else{
            $this->addFlash('error', 'Vous devez vous connecter pour supprimer une vidéo!!');
            return $this->redirectToRoute('app_login');
            }
            
            $manager->remove($video);
            $manager->flush();
            $this->addFlash(
                'success',
                'Votre video a été supprimé avec succès !'
            );
    
            return $this->redirectToRoute('app_home');

    }
}
